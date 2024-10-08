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
 * The GetSystemState200Response model module.
 * @module model/GetSystemState200Response
 * @version 1.0.0
 */
class GetSystemState200Response {
  /**
   * Constructs a new <code>GetSystemState200Response</code>.
   * @alias module:model/GetSystemState200Response
   * @param status {module:model/GetSystemState200Response.StatusEnum} The operational state
   */
  constructor(status) {
    GetSystemState200Response.initialize(this, status);
  }

  /**
   * Initializes the fields of this object.
   * This method is used by the constructors of any subclasses, in order to implement multiple inheritance (mix-ins).
   * Only for internal use.
   */
  static initialize(obj, status) {
    obj.status = status;
  }

  /**
   * Constructs a <code>GetSystemState200Response</code> from a plain JavaScript object, optionally creating a new instance.
   * Copies all relevant properties from <code>data</code> to <code>obj</code> if supplied or a new instance if not.
   * @param {Object} data The plain JavaScript object bearing properties of interest.
   * @param {module:model/GetSystemState200Response} obj Optional instance to populate.
   * @return {module:model/GetSystemState200Response} The populated <code>GetSystemState200Response</code> instance.
   */
  static constructFromObject(data, obj) {
    if (data) {
      obj = obj || new GetSystemState200Response();

      if (Object.prototype.hasOwnProperty.call(data, 'status')) {
        obj.status = ModelUtil.convertToType(data.status, 'String');
      }
      if (Object.prototype.hasOwnProperty.call(data, 'message')) {
        obj.message = ModelUtil.convertToType(data.message, 'String');
      }
    }
    return obj;
  }

  convertToObject() {
    return {
      status: this.status,
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
   * Validates the JSON data with respect to <code>GetSystemState200Response</code>.
   * @param {Object} data The plain JavaScript object bearing properties of interest.
   * @return {boolean} to indicate whether the JSON data is valid with respect to <code>GetSystemState200Response</code>.
   */
  static validateJSON(data) {
    // check to make sure all required properties are present in the JSON string
    for (const property of GetSystemState200Response.RequiredProperties) {
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
    if (!GetSystemState200Response.jsonStringValidation(data, 'status')) {
      throw new Error(
        JSON.stringify({
          customValidationError: true,
          name: 'ModelValidationError',
          message: `Expected the field \`status\` to be a primitive type in the JSON string but got ${data.status}`,
        }),
      );
    }
    // ensure the json data is a string
    if (!GetSystemState200Response.jsonStringValidation(data, 'message')) {
      throw new Error(
        JSON.stringify({
          customValidationError: true,
          name: 'ModelValidationError',
          message: `Expected the field \`message\` to be a primitive type in the JSON string but got ${data.message}`,
        }),
      );
    }

    return true;
  }

  /**
   * Returns The operational state
   * @return {module:model/GetSystemState200Response.StatusEnum}
   */
  getStatus() {
    return this.status;
  }

  /**
   * Sets The operational state
   * @param {module:model/GetSystemState200Response.StatusEnum} status The operational state
   */
  setStatus(status) {
    this.status = status;
  }

  /**
   * Returns Additional information about the state (optional)
   * @return {String}
   */
  getMessage() {
    return this.message;
  }

  /**
   * Sets Additional information about the state (optional)
   * @param {String} message Additional information about the state (optional)
   */
  setMessage(message) {
    this.message = message;
  }

  // Placeholder method to suppress eslint's no-unused-vars error
  static placeholder() {
    ModelUtil.convertToType(123456, 'String');
  }
}

GetSystemState200Response.RequiredProperties = ['status'];

/**
 * The operational state
 * @member {module:model/GetSystemState200Response.StatusEnum} status
 */
GetSystemState200Response.prototype.status = undefined;

/**
 * Additional information about the state (optional)
 * @member {String} message
 */
GetSystemState200Response.prototype.message = undefined;

/**
 * Allowed values for the <code>status</code> property.
 * @enum {String}
 * @readonly
 */
GetSystemState200Response.StatusEnum = {
  /**
   * value: "initializing"
   * @const
   */
  initializing: 'initializing',

  /**
   * value: "ready"
   * @const
   */
  ready: 'ready',

  /**
   * value: "error"
   * @const
   */
  error: 'error',
};

export default GetSystemState200Response;
