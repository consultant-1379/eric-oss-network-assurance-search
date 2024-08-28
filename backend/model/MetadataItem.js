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
 * The MetadataItem model module.
 * @module model/MetadataItem
 * @version 1.0.0
 */
class MetadataItem {
  /**
   * Constructs a new <code>MetadataItem</code>.
   * key/value pair
   * @alias module:model/MetadataItem
   * @param key {String}
   * @param value {String}
   */
  constructor(key, value) {
    MetadataItem.initialize(this, key, value);
  }

  /**
   * Initializes the fields of this object.
   * This method is used by the constructors of any subclasses, in order to implement multiple inheritance (mix-ins).
   * Only for internal use.
   */
  static initialize(obj, key, value) {
    obj.key = key;
    obj.value = value;
  }

  /**
   * Constructs a <code>MetadataItem</code> from a plain JavaScript object, optionally creating a new instance.
   * Copies all relevant properties from <code>data</code> to <code>obj</code> if supplied or a new instance if not.
   * @param {Object} data The plain JavaScript object bearing properties of interest.
   * @param {module:model/MetadataItem} obj Optional instance to populate.
   * @return {module:model/MetadataItem} The populated <code>MetadataItem</code> instance.
   */
  static constructFromObject(data, obj) {
    if (data) {
      obj = obj || new MetadataItem();

      if (Object.prototype.hasOwnProperty.call(data, 'key')) {
        obj.key = ModelUtil.convertToType(data.key, 'String');
      }
      if (Object.prototype.hasOwnProperty.call(data, 'value')) {
        obj.value = ModelUtil.convertToType(data.value, 'String');
      }
    }
    return obj;
  }

  convertToObject() {
    return {
      key: this.key,
      value: this.value,
    };
  }

  static jsonStringValidation(data, keyName) {
    if (data[keyName] && !(typeof data[keyName] === 'string' || data[keyName] instanceof String)) {
      return false;
    }
    return true;
  }

  /**
   * Validates the JSON data with respect to <code>MetadataItem</code>.
   * @param {Object} data The plain JavaScript object bearing properties of interest.
   * @return {boolean} to indicate whether the JSON data is valid with respect to <code>MetadataItem</code>.
   */
  static validateJSON(data) {
    // check to make sure all required properties are present in the JSON string
    for (const property of MetadataItem.RequiredProperties) {
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
    if (!MetadataItem.jsonStringValidation(data, 'key')) {
      throw new Error(
        JSON.stringify({
          customValidationError: true,
          name: 'ModelValidationError',
          message: `Expected the field \`key\` to be a primitive type in the JSON string but got ${data.key}`,
        }),
      );
    }
    // ensure the json data is a string
    if (!MetadataItem.jsonStringValidation(data, 'value')) {
      throw new Error(
        JSON.stringify({
          customValidationError: true,
          name: 'ModelValidationError',
          message: `Expected the field \`value\` to be a primitive type in the JSON string but got ${data.value}`,
        }),
      );
    }

    return true;
  }

  /**
   * @return {String}
   */
  getKey() {
    return this.key;
  }

  /**
   * @param {String} key
   */
  setKey(key) {
    this.key = key;
  }

  /**
   * @return {String}
   */
  getValue() {
    return this.value;
  }

  /**
   * @param {String} value
   */
  setValue(value) {
    this.value = value;
  }

  // Placeholder method to suppress eslint's no-unused-vars error
  static placeholder() {
    ModelUtil.convertToType(123456, 'String');
  }
}

MetadataItem.RequiredProperties = ['key', 'value'];

/**
 * @member {String} key
 */
MetadataItem.prototype.key = undefined;

/**
 * @member {String} value
 */
MetadataItem.prototype.value = undefined;

export default MetadataItem;
