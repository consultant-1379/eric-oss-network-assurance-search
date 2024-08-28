import { expect, fixture, elementUpdated, html } from '@open-wc/testing';
import { ifDefined } from '@eui/lit-component';
import { isRendered } from '../../utils/isRendered.js';
import { nextTick } from '../../utils/utils.js';
import { constants } from '../../utils/constants.js';
import MetricCategoryPill from '../../../src/components/metric-category-pill/metric-category-pill.js';

const unselectedAttribute = 'unselected';

let clickedPillId;
const handleEvent = (event) => {
  clickedPillId = event.target.id;
};

const renderContainer = async ({ pillId, pillLabel, unselected }) => {
  const pillTemplate = html`
    <e-metric-category-pill
      id=${ifDefined(pillId)}
      ?unselected=${ifDefined(unselected)}
      @click=${handleEvent}
      @keydown=${handleEvent}
    >
      ${ifDefined(pillLabel)}
    </e-metric-category-pill>
  `;
  const element = await fixture(pillTemplate);
  await isRendered(element);
  return element;
};

describe('MetricCategoryPill Component Tests', () => {
  const baseProps = {
    pillId: 'category-1',
    pillLabel: 'Category 1',
  };
  const unselectedProps = {
    ...baseProps,
    unselected: true,
  };
  const selectedProps = {
    ...baseProps,
    unselected: false,
  };

  before(() => {
    MetricCategoryPill.register();
  });

  describe('Basic component setup', () => {
    it('should render <e-metric-category-pill>', async () => {
      const component = await fixture('<e-metric-category-pill></e-metric-category-pill>');
      expect(component).to.exist;
    });
  });

  describe('Component rendering', () => {
    it('should create a new <e-metric-category-pill> with a label', async () => {
      const component = await renderContainer(baseProps);
      expect(component.textContent.trim()).to.equal(baseProps.pillLabel);
    });

    it('should create a new <e-metric-category-pill> that is unselected', async () => {
      const component = await renderContainer(unselectedProps);
      expect(component.getAttributeNames().includes(unselectedAttribute)).to.equal(true);
    });

    it('should create a new <e-metric-category-pill> that is selected', async () => {
      const component = await renderContainer(selectedProps);
      expect(component.getAttributeNames().includes(unselectedAttribute)).to.equal(false);
    });

    it('should render unselected and should remain unselected when clicked', async () => {
      /**
       * When an unselected <e-metric-category-pill> component is clicked, it should not
       * become selected because the unselected state should be handled by the application
       * state.
       */
      const component = await renderContainer(unselectedProps);
      expect(component.getAttributeNames().includes(unselectedAttribute)).to.equal(true);
      component.click();

      await nextTick();

      expect(component.getAttributeNames().includes(unselectedAttribute)).to.equal(true);
    });
  });

  describe('Event handling', () => {
    it('should emit an event upon click that contains the pill id', async () => {
      const component = await renderContainer(unselectedProps);

      component.click();
      await nextTick();

      expect(clickedPillId).to.equal(unselectedProps.pillId);
    });

    it('should emit an event upon an ENTER keydown that contains the pill id', async () => {
      const component = await renderContainer(unselectedProps);

      // Hitting the ENTER key on the pill
      const enterKey = constants.KEYDOWN_EVENTS.ENTER;
      component.dispatchEvent(enterKey);
      await elementUpdated(component);

      expect(clickedPillId).to.equal(unselectedProps.pillId);
    });

    it('should emit an event upon a SPACE keydown that contains the pill id', async () => {
      const component = await renderContainer(unselectedProps);

      // Hitting the SPACE key on the pill
      const spaceKey = constants.KEYDOWN_EVENTS.SPACE;
      component.dispatchEvent(spaceKey);
      await elementUpdated(component);

      expect(clickedPillId).to.equal(unselectedProps.pillId);
    });
  });
});
