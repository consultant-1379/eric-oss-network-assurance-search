function validatePropertyType(obj, key, valueType, optional = false) {
  if (Object.hasOwn(obj, key)) {
    const value = obj[key];
    if (valueType === 'string') {
      return typeof value === 'string';
    }
    if (valueType === 'boolean') {
      if (['true', 'false', true, false].includes(value)) {
        return true;
      }
      return false;
    }
    if (valueType === 'number') {
      return !Number.isNaN(value);
    }
    if (valueType === 'array') {
      return Array.isArray(value);
    }
    return false;
  }
  // Returning true when optional because the optional property does not exist which is okay
  return optional;
}

export { validatePropertyType };
