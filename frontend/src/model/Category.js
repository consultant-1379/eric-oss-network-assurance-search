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
 * The Category model module.
 * @module model/Category
 * @version 1.0.0
 */
class Category {
  /**
   * Constructs a new <code>Category</code>.
   * metric category
   * @alias module:model/Category
   * @param name {String} metric category name
   * @param title {String} metric category title which is displayed on UI
   */
  constructor(name, title) {
    Category.initialize(this, name, title);
  }

  /**
   * Initializes the fields of this object.
   * This method is used by the constructors of any subclasses, in order to implement multiple inheritance (mix-ins).
   * Only for internal use.
   */
  static initialize(obj, name, title) {
    obj.name = name;
    obj.title = title;
  }

  /**
   * Constructs a <code>Category</code> from a plain JavaScript object, optionally creating a new instance.
   * Copies all relevant properties from <code>data</code> to <code>obj</code> if supplied or a new instance if not.
   * @param {Object} data The plain JavaScript object bearing properties of interest.
   * @param {module:model/Category} obj Optional instance to populate.
   * @return {module:model/Category} The populated <code>Category</code> instance.
   */
  static constructFromObject(data, obj) {
    if (data) {
      obj = obj || new Category();

      if (Object.prototype.hasOwnProperty.call(data, 'name')) {
        obj.name = ApiClient.convertToType(data.name, 'String');
      }
      if (Object.prototype.hasOwnProperty.call(data, 'title')) {
        obj.title = ApiClient.convertToType(data.title, 'String');
      }
    }
    return obj;
  }

  convertToObject() {
    return {
      name: this.name,
      title: this.title,
    };
  }

  static jsonStringValidation(data, keyName) {
    if (data[keyName] && !(typeof data[keyName] === 'string' || data[keyName] instanceof String)) {
      return false;
    }
    return true;
  }

  /**
   * Validates the JSON data with respect to <code>Category</code>.
   * @param {Object} data The plain JavaScript object bearing properties of interest.
   * @return {boolean} to indicate whether the JSON data is valid with respect to <code>Category</code>.
   */
  static validateJSON(data) {
    // check to make sure all required properties are present in the JSON string
    for (const property of Category.RequiredProperties) {
      if (!data[property]) {
        throw new Error(
          `The required field \`${property}\` is not found in the JSON data: ${JSON.stringify(
            data,
          )}`,
        );
      }
    }
    // ensure the json data is a string
    if (!Category.jsonStringValidation(data, 'name')) {
      throw new Error(
        `Expected the field \`name\` to be a primitive type in the JSON string but got ${data.name}`,
      );
    }
    // ensure the json data is a string
    if (!Category.jsonStringValidation(data, 'title')) {
      throw new Error(
        `Expected the field \`title\` to be a primitive type in the JSON string but got ${data.title}`,
      );
    }

    return true;
  }

  /**
   * Returns metric category name
   * @return {String}
   */
  getName() {
    return this.name;
  }

  /**
   * Sets metric category name
   * @param {String} name metric category name
   */
  setName(name) {
    this.name = name;
  }

  /**
   * Returns metric category title which is displayed on UI
   * @return {String}
   */
  getTitle() {
    return this.title;
  }

  /**
   * Sets metric category title which is displayed on UI
   * @param {String} title metric category title which is displayed on UI
   */
  setTitle(title) {
    this.title = title;
  }

  // Placeholder method to suppress eslint's no-unused-vars error
  static placeholder() {
    ApiClient.convertToType(123456, 'String');
  }
}

Category.RequiredProperties = ['name', 'title'];

/**
 * metric category name
 * @member {String} name
 */
Category.prototype.name = undefined;

/**
 * metric category title which is displayed on UI
 * @member {String} title
 */
Category.prototype.title = undefined;

export default Category;
