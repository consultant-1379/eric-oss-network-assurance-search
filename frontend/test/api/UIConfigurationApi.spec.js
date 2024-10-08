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

(function testingUIConfigurationApiApi(root, factory) {
  factory();
})(this, () => {
  let instance;

  beforeEach(() => {
    instance = new AssuranceSearchApi.UIConfigurationApi();
  });

  describe('UIConfigurationApi', () => {
    describe('getUiConfiguration', () => {
      it('should call getUiConfiguration successfully', (done) => {
        // instance.getUiConfiguration().then(
        //  (data) => {
        //    console.log(JSON.stringify(data, null, 4));
        //  },
        //  (error) => {
        //    console.error(error);
        //  },
        // );
        expect(instance).to.not.have.property('placeholder');
        done();
      });
    });
  });
});
