import { expect } from '@open-wc/testing';
import isEqual from 'lodash/isEqual';
import { initializeStateManagement } from '../../src/utils/stateManager';

const noop = () => {};
const empty = {};

describe('State Management Tests', () => {
  let updatedState;
  let registeredEventType;
  let registeredEventHandler;

  /**
   * Managed state object
   * @type {Object}
   */
  const state = {};
  const actions = {
    testAction: {
      triggerOnEvent: 'test-action',
      eventHandler: ({ getState, updateState }, eventPayload) =>
        // Test action simply writes an event to the state
        updateState({ ...getState(), ...eventPayload }),
    },
  };

  initializeStateManagement({
    getState: () => state,
    updateState: (changedState) => {
      updatedState = changedState;
    },
    emitEvent: noop,
    addEventListener: (eventType, handler) => {
      registeredEventType = eventType;
      registeredEventHandler = handler;
    },
    removeEventListener: noop,
    stateActions: actions,
    stateEffects: empty,
  });

  it('should have properly register the state action ', async () => {
    expect(registeredEventType).to.equal('test-action');
  });

  it('event handler should be a function', async () => {
    expect(registeredEventHandler).to.be.a('function');
  });

  it('event handler should be able to process an event ', async () => {
    const event = { detail: { greetings: 'Hi!' } };
    registeredEventHandler(event);

    expect(isEqual(updatedState, { greetings: 'Hi!' })).to.be.true;
  });
});
