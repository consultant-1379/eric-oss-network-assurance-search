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
 * The UiConfigRoutesInternal model module.
 * @module model/UiConfigRoutesInternal
 * @version 1.0.0
 */
class UiConfigRoutesInternal {
  /**
   * Initializes the fields of this object.
   * This method is used by the constructors of any subclasses, in order to implement multiple inheritance (mix-ins).
   * Only for internal use.
   */
  static initialize(obj) {
    return obj;
  }

  /**
   * Constructs a <code>UiConfigRoutesInternal</code> from a plain JavaScript object, optionally creating a new instance.
   * Copies all relevant properties from <code>data</code> to <code>obj</code> if supplied or a new instance if not.
   * @param {Object} data The plain JavaScript object bearing properties of interest.
   * @param {module:model/UiConfigRoutesInternal} obj Optional instance to populate.
   * @return {module:model/UiConfigRoutesInternal} The populated <code>UiConfigRoutesInternal</code> instance.
   */
  static constructFromObject(data, obj) {
    if (data) {
      obj = obj || new UiConfigRoutesInternal();

      if (Object.prototype.hasOwnProperty.call(data, 'prefix')) {
        obj.prefix = ModelUtil.convertToType(data.prefix, 'String');
      }
      if (Object.prototype.hasOwnProperty.call(data, 'routes')) {
        obj.routes = ModelUtil.convertToType(data.routes, 'Object');
      }
    }
    return obj;
  }

  convertToObject() {
    return {
      prefix: this.prefix,
      routes: this.routes,
    };
  }

  static jsonStringValidation(data, keyName) {
    if (data[keyName] && !(typeof data[keyName] === 'string' || data[keyName] instanceof String)) {
      return false;
    }
    return true;
  }

  /**
   * Validates the JSON data with respect to <code>UiConfigRoutesInternal</code>.
   * @param {Object} data The plain JavaScript object bearing properties of interest.
   * @return {boolean} to indicate whether the JSON data is valid with respect to <code>UiConfigRoutesInternal</code>.
   */
  static validateJSON(data) {
    // ensure the json data is a string
    if (!UiConfigRoutesInternal.jsonStringValidation(data, 'prefix')) {
      throw new Error(
        JSON.stringify({
          customValidationError: true,
          name: 'ModelValidationError',
          message: `Expected the field \`prefix\` to be a primitive type in the JSON string but got ${data.prefix}`,
        }),
      );
    }

    return true;
  }

  /**
   * @return {String}
   */
  getPrefix() {
    return this.prefix;
  }

  /**
   * @param {String} prefix
   */
  setPrefix(prefix) {
    this.prefix = prefix;
  }

  /**
   * @return {Object}
   */
  getRoutes() {
    return this.routes;
  }

  /**
   * @param {Object} routes
   */
  setRoutes(routes) {
    this.routes = routes;
  }

  // Placeholder method to suppress eslint's no-unused-vars error
  static placeholder() {
    ModelUtil.convertToType(123456, 'String');
  }
}

/**
 * @member {String} prefix
 */
UiConfigRoutesInternal.prototype.prefix = undefined;

/**
 * @member {Object} routes
 */
UiConfigRoutesInternal.prototype.routes = undefined;

export default UiConfigRoutesInternal;
