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

import { expect } from 'chai';
import * as AssuranceSearchApi from '../../src/index.js';

(function testingUiConfigurationModel(root, factory) {
  factory();
})(this, () => {
  let instance;

  beforeEach(() => {
    instance = new AssuranceSearchApi.UiConfiguration();
  });

  describe('UiConfiguration', () => {
    it('should create an instance of UiConfiguration', () => {
      // uncomment below and update the code to test UiConfiguration
      instance = new AssuranceSearchApi.UiConfiguration();
      expect(instance).to.be.an.instanceOf(AssuranceSearchApi.UiConfiguration);
    });

    it('should have the property families (base name: "families")', () => {
      // uncomment below and update the code to test the property families
      instance = new AssuranceSearchApi.UiConfiguration();
      expect(instance).to.not.have.property('placeholder');
    });

    it('should have the property groups (base name: "groups")', () => {
      // uncomment below and update the code to test the property groups
      instance = new AssuranceSearchApi.UiConfiguration();
      expect(instance).to.not.have.property('placeholder');
    });

    it('should have the property categories (base name: "categories")', () => {
      // uncomment below and update the code to test the property categories
      instance = new AssuranceSearchApi.UiConfiguration();
      expect(instance).to.not.have.property('placeholder');
    });

    it('should have the property contexts (base name: "contexts")', () => {
      // uncomment below and update the code to test the property categories
      instance = new AssuranceSearchApi.UiConfiguration();
      expect(instance).to.not.have.property('placeholder');
    });
  });
});
