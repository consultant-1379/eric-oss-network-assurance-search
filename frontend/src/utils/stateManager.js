import cloneDeep from 'lodash/cloneDeep';
import dropRight from 'lodash/dropRight';
import find from 'lodash/find';
import findKey from 'lodash/findKey';
import forEach from 'lodash/forEach';
import get from 'lodash/get';
import isEqual from 'lodash/isEqual';
import keys from 'lodash/keys';
import map from 'lodash/map';
import set from 'lodash/set';
import toPath from 'lodash/toPath';
import unset from 'lodash/unset';
import { JSONPath } from 'jsonpath-plus';

/**
 * A Function to handle action event
 * @callback EventHandler
 * @param {StateAccessor} stateAccessor - state accessor
 * @param {Object} payload - payload
 */

/**
 * State action object.
 * @typedef {Object} StateAction
 * @property {String} triggerOnEvent - event type to trigger this action
 * @property {EventHandler} eventHandler - function to handle the event
 */

/**
 * State actions definition.
 * @typedef {Object} StateActionDefinition
 * @property {Object.<string, StateAction>} actions - An object containing keys with their corresponding nested actions.
 */

/**
 * Payload attached to effect event
 *
 * @typedef {Object} EffectPayload
 *
 * @property {String[]} path,
 * @property {String[]} parentPath,
 * @property {Object} changedObject,
 * @property {Object} changedProperty,
 * @property {Object} previousValue,
 * @property {Object} changedValue,
 */

/**
 * Event handler
 * @callback eventHandler
 * @param {StateAccessor} stateAccessor - state accessor
 * @param payload
 * @returns {Object} state
 */

/**
 * @typedef {Object} Action
 * @property {string} triggerOnEvent - type of event to trigger the action
 * @property {eventHandler} eventHandler - event handler
 */

/**
 * Access to the state of the application
 * @callback stateReader
 * @returns {Object} - application sub-state
 */

/**
 * Access to the sub-state of the application
 * @callback subStateReader
 * @returns {Object} - application sub-state
 */

/**
 * Writes the state of the application
 * @callback stateWriter
 * @param {Object} state - global application state
 */

/**
 * Writes the sub-state of the application
 * @callback subStateWriter
 * @param {Object} state - application sub-state
 */

/**
 * State access interface
 * @typedef {Object} StateAccessor
 * @property {stateReader} [getState] - get application state
 * @property {stateWriter} updateState - update application with new state
 * @property {subStateReader} [getSubState] - get application sub-state
 * @property {subStateWriter} [updateSubState] - update application with new state
 */

/**
 * Global inner state.
 * Utilized for storing supplementary contextual state.
 * @type {{}}
 */
const innerState = {};

/**
 * @param {StateAccessor} stateAccessor - accessor to the state of application
 * @param {stateReader} getState - accessor to the state of application
 * @param {Object} eventTarget - event emitter element
 * @param {string} rootSubState - key that represents the root on the sub-state
 * @param {string} subState - key associated with the sub-state
 * @param {string[]} actionEventTypes - list of event types to track
 * @param {Object} actionsDefinition - definitions object map
 * @param {stateWriter} updateState - accessor function to store modified application state
 */
export const enableSubState = (
  { getState, updateState },
  eventTarget,
  rootSubState,
  subState,
  actionEventTypes,
  actionsDefinition,
) => {
  actionEventTypes.forEach((actionEventType) => {
    const found = findKey(actionsDefinition, { triggerOnEvent: actionEventType });
    const { eventHandler } = actionsDefinition[found];

    const eventListenerHandler = async (event) => {
      event.stopPropagation();

      const getSubState = () => find(getState()[rootSubState], (c) => c.id === subState) || {};

      const updateSubState = (v) => {
        const state = getState();
        map(state[rootSubState], (c, index) => {
          if (c.id === subState) {
            set(state, `[${rootSubState}].[${index}]`, v);
          }
        });

        updateState(state);
      };

      await eventHandler({ getState, getSubState, updateSubState, updateState }, event.detail);
    };

    // Add new event listener
    eventTarget.addEventListener(actionEventType, eventListenerHandler);

    // Create a destructor function and store it in inner state
    set(innerState, `[subStateDestructors].[${subState}].[${actionEventType}]`, () =>
      eventTarget.removeEventListener(actionEventType, eventListenerHandler),
    );
  });
};

/**
 * Converts to `path` lodash understands
 * @param path
 * @returns {string[]}
 */
const toLodashPath = (path) => toPath(path).slice(1);

/**
 * Get parent lodash path from given path
 * @param path
 * @returns {unknown[]}
 */
const parentPath = (path) => dropRight(path);

/**
 * Generate a unique ID for the effect
 * @param effectKey
 * @param jsonPointer
 * @returns {`${string}:${string}`}
 */
const toEffectId = (effectKey, jsonPointer) => `${effectKey}:${jsonPointer}`;

/**
 * Compiles effects.
 * @param getState
 * @param effectsDeclaration
 * @param emitEvent
 * @param previouslyCompiledEffects
 */
const compileEffects = (getState, effectsDeclaration, emitEvent, previouslyCompiledEffects) =>
  // Loop over declared effects
  Object.entries(effectsDeclaration).reduce(
    (compiledEffects, [key, { selector, emitEventType, eventPayload }]) => {
      // Find all values from the state pointed by selectors
      const selectorMatches = JSONPath({ path: selector, json: getState(), resultType: 'all' });

      selectorMatches.forEach(({ path, pointer, parent, parentProperty, value }) => {
        // Keep last selected value
        let oldValue;
        const currentEffectId = toEffectId(key, pointer);

        // Copy old values from previous scan is exists
        const previousMatch = find(previouslyCompiledEffects, (o) => o.id === currentEffectId);
        if (previousMatch !== undefined) {
          const lastValue = previousMatch.lastValue();
          if (lastValue !== undefined) {
            oldValue = previousMatch.lastValue();
          }
        }

        compiledEffects.push({
          runEffects: () => {
            const newValue = value;
            const changed = !(isEqual(newValue, oldValue) && newValue !== undefined);

            if (changed) {
              // The change is detected, run the effect and fire an event
              if (eventPayload) {
                const computed = eventPayload({
                  path: toLodashPath(parentPath),
                  parentPath: parentPath(toLodashPath(path)),
                  changedObject: parent,
                  changedProperty: parentProperty,
                  previousValue: oldValue,
                  changedValue: newValue,
                });
                emitEvent(emitEventType, computed);
              } else {
                emitEvent(emitEventType);
              }
            }
          },
          id: currentEffectId,
          lastValue: () => cloneDeep(value),
        });
      });

      return compiledEffects;
    },
    [],
  );

/**
 * Run stored destructor functions for specified path
 * @param path
 */
const runDestructors = (path) => {
  const subStateDestructors = get(innerState, path);
  forEach(subStateDestructors, (destruct) => {
    if (typeof destruct === 'function') {
      destruct();
    }
  });

  unset(innerState, path);
};

/**
 * Removes all listeners from the sub-state
 * @param {string} subState - key associated with the sub-state
 */
export const disableSubState = (subState) => {
  runDestructors(`[subStateDestructors].[${subState}]`);
};

/**
 * Release all the resources associated with the State Manager
 */
export function destroyStateManagement() {
  // Release all event listeners
  runDestructors(`[destructors]`);

  // Remove any sub-destructors if there are any
  const subStates = keys(innerState.subStateDestructors);
  subStates.forEach((subState) => disableSubState(subState));
}

/**
 * Initialized actions.
 *
 * @param {Object} obj - an initialization object
 * @param {function} obj.getState - State getter
 * @param {function} obj.updateState - State updater handler
 * @param {Object} obj.stateActions - State actions definition
 * @param {Object} obj.stateEffects - State effects definition
 * @param {function} obj.addEventListener - Event listener attach handler
 * @param {function} obj.emitEvent - Event emitter handler
 */
export function initializeStateManagement({
  stateActions,
  stateEffects,
  getState,
  updateState,
  addEventListener,
  removeEventListener,
  emitEvent,
}) {
  // Make sure no previous state exist
  destroyStateManagement();

  /**
   * Compiled Effects to keep track
   */
  let effects = compileEffects(getState, stateEffects, emitEvent);

  /**
   * Iterate over defined actions and install listeners
   */
  Object.entries(stateActions).forEach(([, { triggerOnEvent, eventHandler }]) => {
    const handler = async (event) => {
      /**
       * @type {StateAccessor}
       */
      const stateAccessor = {
        getState,
        updateState: (state) => {
          updateState(state);
          // Effects needs to be recompiled every time the state is updated because
          // the dynamic properties could be added.
          effects = compileEffects(getState, stateEffects, emitEvent, effects);
          // Run effects
          effects.forEach((e) => e.runEffects());
        },
      };

      await eventHandler(stateAccessor, event.detail);
    };

    addEventListener(triggerOnEvent, handler);

    // Create a destructor function and push it into inner state
    set(innerState, `[destructors].[${triggerOnEvent}]`, () =>
      removeEventListener(triggerOnEvent, handler),
    );
  });
}
