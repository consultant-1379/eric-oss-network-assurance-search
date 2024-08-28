/**
 * Replaces template string `'This {{some_var}}'` with values from passed map `{some_var: 'some value'}`
 * @param template {String} template to be updated
 * @param variables {Object} substitution variables map
 * @returns {String} resolved template to a string
 */
export default (template, variables) =>
  template.replace(/{{(.*?)}}/g, (match, key) => variables[key.trim()]);
