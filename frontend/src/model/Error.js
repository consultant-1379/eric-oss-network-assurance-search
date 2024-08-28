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

import ApiClient from '../ApiClient.js';

/**
 * The Error model module.
 * @module model/Error
 * @version 1.0.0
 */
class Error {
  /**
   * Constructs a new <code>Error</code>.
   * @alias module:model/Error
   * @param code {Number}
   * @param message {String}
   */
  constructor(code, message) {
    Error.initialize(this, code, message);
  }

  /**
   * Initializes the fields of this object.
   * This method is used by the constructors of any subclasses, in order to implement multiple inheritance (mix-ins).
   * Only for internal use.
   */
  static initialize(obj, code, message) {
    obj.code = code;
    obj.message = message;
  }

  /**
   * Constructs a <code>Error</code> from a plain JavaScript object, optionally creating a new instance.
   * Copies all relevant properties from <code>data</code> to <code>obj</code> if supplied or a new instance if not.
   * @param {Object} data The plain JavaScript object bearing properties of interest.
   * @param {module:model/Error} obj Optional instance to populate.
   * @return {module:model/Error} The populated <code>Error</code> instance.
   */
  static constructFromObject(data, obj) {
    if (data) {
      obj = obj || new Error();

      if (Object.prototype.hasOwnProperty.call(data, 'code')) {
        obj.code = ApiClient.convertToType(data.code, 'Number');
      }
      if (Object.prototype.hasOwnProperty.call(data, 'message')) {
        obj.message = ApiClient.convertToType(data.message, 'String');
      }
    }
    return obj;
  }

  convertToObject() {
    return {
      code: this.code,
      message: this.message,
    };
  }

  static jsonStringValidation(data, keyName) {
    if (data[keyName] && !(typeof data[keyName] === 'string' || data[keyName] instanceof String)) {
      return false;
    }
    return true;
  }

  /**
   * Validates the JSON data with respect to <code>Error</code>.
   * @param {Object} data The plain JavaScript object bearing properties of interest.
   * @return {boolean} to indicate whether the JSON data is valid with respect to <code>Error</code>.
   */
  static validateJSON(data) {
    // check to make sure all required properties are present in the JSON string
    for (const property of Error.RequiredProperties) {
      if (!data[property]) {
        throw new Error(
          `The required field \`${property}\` is not found in the JSON data: ${JSON.stringify(
            data,
          )}`,
        );
      }
    }
    // ensure the json data is a string
    if (!Error.jsonStringValidation(data, 'message')) {
      throw new Error(
        `Expected the field \`message\` to be a primitive type in the JSON string but got ${data.message}`,
      );
    }

    return true;
  }

  /**
   * @return {Number}
   */
  getCode() {
    return this.code;
  }

  /**
   * @param {Number} code
   */
  setCode(code) {
    this.code = code;
  }

  /**
   * @return {String}
   */
  getMessage() {
    return this.message;
  }

  /**
   * @param {String} message
   */
  setMessage(message) {
    this.message = message;
  }

  // Placeholder method to suppress eslint's no-unused-vars error
  static placeholder() {
    ApiClient.convertToType(123456, 'String');
  }
}

Error.RequiredProperties = ['code', 'message'];

/**
 * @member {Number} code
 */
Error.prototype.code = undefined;

/**
 * @member {String} message
 */
Error.prototype.message = undefined;

export default Error;
