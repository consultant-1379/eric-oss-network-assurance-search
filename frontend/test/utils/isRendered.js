import { waitUntil, aTimeout } from '@open-wc/testing-helpers';
import { constants } from './constants';

const isReady = async (elements) => {
  if (elements.length === 0) {
    return true;
  }
  const element = elements.shift();
  const isCustomElement = element.tagName.includes('-');
  if (isCustomElement) {
    await waitUntil(
      () => element?.shadowRoot?.hasChildNodes(),
      'Element should have children in time.',
      { interval: 50, timeout: constants.CHILDREN_WAIT_TIMEOUT },
    );
    return isReady([...elements, ...element.shadowRoot.children]);
  }
  return isReady([...elements, ...element.children]);
};

export const isRendered = async (element) => {
  await waitUntil(() => isReady([element]), 'Element should become ready in time', {
    interval: 50,
    timeout: constants.ROOT_WAIT_TIMEOUT,
  });
  await aTimeout(constants.NEXT_TICK_WAIT_TIMEOUT);
};
