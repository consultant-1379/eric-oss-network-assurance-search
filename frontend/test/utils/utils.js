let i = 0;

export function stubRouter({ hash } = {}) {
  const ROUTE = hash || 'product-page';
  window.EUI = { ...window.EUI };
  window.EUI.Router = {
    currentHref: '',
    goto: () => {},
    routeMap: { launcher: ROUTE },
    addRoute: () => {
      i += 1;
      return i;
    },
    removeRoute: () => {},
  };
  return ROUTE;
}

export function nextTick() {
  return new Promise((resolve) => {
    setTimeout(resolve, 0);
  });
}

/**
 * Finds descendant element from the root element
 * through shadow DOMs by traversing from element to element.
 * Selectors should point to the next element with Shadow DOM.
 *
 * @param element the element to start piercing from
 * @param selectors selectors for elements in the chain
 * @returns {*|null} element or null if element is not found
 */
export function pierce(element, ...selectors) {
  for (const selector of selectors) {
    try {
      const current = element.shadowRoot.querySelector(selector);

      if (current) {
        element = current;
      } else {
        console.error(`Element with selector "${selector}" not found.`);
        return null;
      }
    } catch (error) {
      console.error(`Error occurred while processing selector "${selector}": ${error.message}`);
      return null;
    }
  }

  return element; // Return the final element after applying all selectors
}
