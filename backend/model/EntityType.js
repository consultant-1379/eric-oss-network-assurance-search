/**
 * Assurance Search API
 * ```   Ericsson   |   DocNo n/155 19-CAF CAF 101 105/3   |   Rev PA1   |   Inter-work Description ``` ## Introduction This document describes the User Interface Internal REST API identified in the ADP GUI FA. ### Terms - **UI Internal Interface**: The interface providing access to static content meant to be used exclusively by the User Interface itself. All static content paths are relative to this URI. - **Client Container**: An SPA (Single Page Application) implementing the App Shell pattern e.g. E-UI SDK Container. - **UI App**: A full screen user interface exposed by a Microservice that can execute in the Client Container e.g. E-UI SDK App. - ***External UI App***: Any UIs that have a separate web page (outside the Client Container) or other alternative renderer e.g. Citrix. - **UI Component**: A reusable, embeddable UI Web Component exposed by a Microservice e.g. E-UI SDK Shareable Components.
 *
 * The version of the OpenAPI document: 1.0.0
 * Contact: sasha.katsman@ericsson.com
 *
 * NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
 * https://openapi-generator.tech
 * Do not edit the class manually.
 *
 */

import ModelUtil from '../utils/ModelUtil.js';
/* eslint-disable no-unused-vars */
/* eslint-enable no-unused-vars */

/**
 * The EntityType model module.
 * @module model/EntityType
 * @version 1.0.0
 */
class EntityType {
  /**
   * Constructs a new <code>EntityType</code>.
   * entity type
   * @alias module:model/EntityType
   * @param id {String} entity type id, normally has the prefix of 'c_'
   */
  constructor(id) {
    EntityType.initialize(this, id);
  }

  /**
   * Initializes the fields of this object.
   * This method is used by the constructors of any subclasses, in order to implement multiple inheritance (mix-ins).
   * Only for internal use.
   */
  static initialize(obj, id) {
    obj.id = id;
  }

  /**
   * Constructs a <code>EntityType</code> from a plain JavaScript object, optionally creating a new instance.
   * Copies all relevant properties from <code>data</code> to <code>obj</code> if supplied or a new instance if not.
   * @param {Object} data The plain JavaScript object bearing properties of interest.
   * @param {module:model/EntityType} obj Optional instance to populate.
   * @return {module:model/EntityType} The populated <code>EntityType</code> instance.
   */
  static constructFromObject(data, obj) {
    if (data) {
      obj = obj || new EntityType();

      if (Object.prototype.hasOwnProperty.call(data, 'id')) {
        obj.id = ModelUtil.convertToType(data.id, 'String');
      }
      if (Object.prototype.hasOwnProperty.call(data, 'name')) {
        obj.name = ModelUtil.convertToType(data.name, 'String');
      }
      if (Object.prototype.hasOwnProperty.call(data, 'description')) {
        obj.description = ModelUtil.convertToType(data.description, 'String');
      }
    }
    return obj;
  }

  convertToObject() {
    return {
      id: this.id,
      name: this.name,
      description: this.description,
    };
  }

  static jsonStringValidation(data, keyName) {
    if (data[keyName] && !(typeof data[keyName] === 'string' || data[keyName] instanceof String)) {
      return false;
    }
    return true;
  }

  /**
   * Validates the JSON data with respect to <code>EntityType</code>.
   * @param {Object} data The plain JavaScript object bearing properties of interest.
   * @return {boolean} to indicate whether the JSON data is valid with respect to <code>EntityType</code>.
   */
  static validateJSON(data) {
    // check to make sure all required properties are present in the JSON string
    for (const property of EntityType.RequiredProperties) {
      if (!data[property]) {
        throw new Error(
          JSON.stringify({
            customValidationError: true,
            name: 'ModelValidationError',
            message: `The required field \`${property}\` is not found in the JSON data: ${JSON.stringify(
              data,
            )}`,
          }),
        );
      }
    }
    // ensure the json data is a string
    if (!EntityType.jsonStringValidation(data, 'id')) {
      throw new Error(
        JSON.stringify({
          customValidationError: true,
          name: 'ModelValidationError',
          message: `Expected the field \`id\` to be a primitive type in the JSON string but got ${data.id}`,
        }),
      );
    }
    // ensure the json data is a string
    if (!EntityType.jsonStringValidation(data, 'name')) {
      throw new Error(
        JSON.stringify({
          customValidationError: true,
          name: 'ModelValidationError',
          message: `Expected the field \`name\` to be a primitive type in the JSON string but got ${data.name}`,
        }),
      );
    }
    // ensure the json data is a string
    if (!EntityType.jsonStringValidation(data, 'description')) {
      throw new Error(
        JSON.stringify({
          customValidationError: true,
          name: 'ModelValidationError',
          message: `Expected the field \`description\` to be a primitive type in the JSON string but got ${data.description}`,
        }),
      );
    }

    return true;
  }

  /**
   * Returns entity type id, normally has the prefix of 'c_'
   * @return {String}
   */
  getId() {
    return this.id;
  }

  /**
   * Sets entity type id, normally has the prefix of 'c_'
   * @param {String} id entity type id, normally has the prefix of 'c_'
   */
  setId(id) {
    this.id = id;
  }

  /**
   * Returns entity type name
   * @return {String}
   */
  getName() {
    return this.name;
  }

  /**
   * Sets entity type name
   * @param {String} name entity type name
   */
  setName(name) {
    this.name = name;
  }

  /**
   * Returns entity description
   * @return {String}
   */
  getDescription() {
    return this.description;
  }

  /**
   * Sets entity description
   * @param {String} description entity description
   */
  setDescription(description) {
    this.description = description;
  }

  // Placeholder method to suppress eslint's no-unused-vars error
  static placeholder() {
    ModelUtil.convertToType(123456, 'String');
  }
}

EntityType.RequiredProperties = ['id'];

/**
 * entity type id, normally has the prefix of 'c_'
 * @member {String} id
 */
EntityType.prototype.id = undefined;

/**
 * entity type name
 * @member {String} name
 */
EntityType.prototype.name = undefined;

/**
 * entity description
 * @member {String} description
 */
EntityType.prototype.description = undefined;

export default EntityType;
