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
import UiConfigLogging from './UiConfigLogging.js';
import UiConfigRoutes from './UiConfigRoutes.js';

/**
 * The UiConfig model module.
 * @module model/UiConfig
 * @version 1.0.0
 */
class UiConfig {
  /**
   * Initializes the fields of this object.
   * This method is used by the constructors of any subclasses, in order to implement multiple inheritance (mix-ins).
   * Only for internal use.
   */
  static initialize(obj) {
    return obj;
  }

  /**
   * Constructs a <code>UiConfig</code> from a plain JavaScript object, optionally creating a new instance.
   * Copies all relevant properties from <code>data</code> to <code>obj</code> if supplied or a new instance if not.
   * @param {Object} data The plain JavaScript object bearing properties of interest.
   * @param {module:model/UiConfig} obj Optional instance to populate.
   * @return {module:model/UiConfig} The populated <code>UiConfig</code> instance.
   */
  static constructFromObject(data, obj) {
    if (data) {
      obj = obj || new UiConfig();

      if (Object.prototype.hasOwnProperty.call(data, 'logging')) {
        obj.logging = UiConfigLogging.constructFromObject(data.logging);
      }
      if (Object.prototype.hasOwnProperty.call(data, 'routes')) {
        obj.routes = UiConfigRoutes.constructFromObject(data.routes);
      }
    }
    return obj;
  }

  convertToObject() {
    return {
      logging: this.logging,
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
   * Validates the JSON data with respect to <code>UiConfig</code>.
   * @param {Object} data The plain JavaScript object bearing properties of interest.
   * @return {boolean} to indicate whether the JSON data is valid with respect to <code>UiConfig</code>.
   */
  static validateJSON(data) {
    // validate the optional field `logging`
    if (data.logging) {
      // data not null
      UiConfigLogging.validateJSON(data.logging);
    }
    // validate the optional field `routes`
    if (data.routes) {
      // data not null
      UiConfigRoutes.validateJSON(data.routes);
    }

    return true;
  }

  /**
   * @return {module:model/UiConfigLogging}
   */
  getLogging() {
    return this.logging;
  }

  /**
   * @param {module:model/UiConfigLogging} logging
   */
  setLogging(logging) {
    this.logging = logging;
  }

  /**
   * @return {module:model/UiConfigRoutes}
   */
  getRoutes() {
    return this.routes;
  }

  /**
   * @param {module:model/UiConfigRoutes} routes
   */
  setRoutes(routes) {
    this.routes = routes;
  }

  // Placeholder method to suppress eslint's no-unused-vars error
  static placeholder() {
    ApiClient.convertToType(123456, 'String');
  }
}

/**
 * @member {module:model/UiConfigLogging} logging
 */
UiConfig.prototype.logging = undefined;

/**
 * @member {module:model/UiConfigRoutes} routes
 */
UiConfig.prototype.routes = undefined;

export default UiConfig;
