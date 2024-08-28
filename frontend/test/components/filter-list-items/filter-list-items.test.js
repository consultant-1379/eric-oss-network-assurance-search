import { expect, fixture, html } from '@open-wc/testing';
import { ifDefined } from '@eui/lit-component';
import BaseListItem from '../../../src/components/filter-list-items/filter-list-items';
import { isRendered } from '../../utils/isRendered';

const UPDATE_FILTERS_EVENT = 'update-filters';

let eventData;
const handleEvent = (event) => {
  eventData = event;
};

const renderContainer = async (
  { id, label, match, selected, disabled, error, group, item, noicons },
  selector,
) => {
  const baseListItemTemplate = html`
    <e-filter-list-items
      id=${ifDefined(id)}
      label=${ifDefined(label)}
      .match=${ifDefined(match)}
      ?selected=${ifDefined(selected)}
      ?disabled=${ifDefined(disabled)}
      error=${ifDefined(error)}
      .selectiontype=${ifDefined(group)}
      .itemtype=${ifDefined(item)}
      ?noicons=${ifDefined(noicons)}
      @edit-filter=${handleEvent}
      @delete-filter=${handleEvent}
      @update-filters=${handleEvent}
    ></e-filter-list-items>
  `;
  const element = await fixture(baseListItemTemplate);
  await isRendered(element);
  if (selector === 'basefilter') {
    return element.shadowRoot.querySelector('.base-filter-list');
  }
  return element.shadowRoot.querySelector('eui-tooltip');
};

describe('BaseListItem Component Tests', () => {
  let container;

  before(() => {
    BaseListItem.register();
  });

  it('should highlight match in bold', async () => {
    container = await renderContainer(
      { id: 123, label: 'KPI A', match: 'A', group: 'checkbox' },
      'basefilter',
    );
    const highlight = container.querySelector('#highlight').innerText.trim();
    expect(highlight).to.be.equal('A');
  });

  it('should disable list when disabled props is true regardless of tooltip error msg', async () => {
    container = await renderContainer(
      {
        label: 'No Filters Applied',
        group: 'radio',
        disabled: true,
      },
      'basefilter',
    );
    const checkbox = container.querySelector('eui-radio-button').getAttribute('disabled');
    expect(checkbox).to.exist;
  });

  it('should disable list when disabled props is true with tooltip erro msg', async () => {
    container = await renderContainer(
      {
        label: 'KPI C',
        match: 'C',
        group: 'checkbox',
        disabled: true,
        error: 'Applied filters has reached max Limit',
      },
      'basefilter',
    );
    const checkbox = container.querySelector('eui-checkbox').getAttribute('disabled');
    expect(checkbox).to.exist;
  });

  it('should display tooltip when error props is passed with message', async () => {
    container = await renderContainer({
      label: 'KPI A',
      match: 'A',
      group: 'checkbox',
      error: 'Applied filters has reached max Limit',
    });
    const tooltip = container.querySelector('#max_limit_msg');
    expect(tooltip).to.exist;
  });

  it('should not display tooltip when there is no tooltip error message', async () => {
    container = await renderContainer({
      label: 'KPI D',
      match: 'KP',
      group: 'checkbox',
    });
    const tooltip = container.querySelector('#max_limit_msg');
    expect(tooltip).to.not.exist;
  });

  it('should emit edit filter event when edit icon is clicked', async () => {
    container = await renderContainer(
      {
        id: '123',
        match: 'A',
        group: 'checkbox',
        item: 'ITEMTYPE',
      },
      'basefilter',
    );
    const expected = {
      id: '123',
      type: 'ITEMTYPE',
    };
    container.querySelector('.edit').click();
    expect(eventData.type).to.equal('edit-filter');
    expect(eventData.detail).to.deep.equal(expected);
  });

  it('should emit delete filter event when trashcan icon is clicked', async () => {
    container = await renderContainer(
      { id: '123', match: 'A', group: 'checkbox', item: 'ITEMTYPE' },
      'basefilter',
    );
    const expected = {
      data: {
        id: '123',
        type: 'ITEMTYPE',
      },
      updateOperation: 'remove-filter',
    };
    container.querySelector('.remove').click();
    expect(eventData.type).to.equal(UPDATE_FILTERS_EVENT);
    expect(eventData.detail).to.deep.equal(expected);
  });

  it('should emit update filter event when radio button is clicked', async () => {
    container = await renderContainer(
      {
        id: '123',
        match: '500',
        group: 'radio',
        item: 'ITEMTYPE',
      },
      'basefilter',
    );
    const expected = {
      data: {
        id: '123',
        type: 'ITEMTYPE',
      },
      updateOperation: 'select-filter',
    };
    container.querySelector('eui-radio-button').click();
    expect(eventData.type).to.equal(UPDATE_FILTERS_EVENT);
    expect(eventData.detail).to.deep.equal(expected);
  });

  it('should emit update filter event when checkbox is clicked', async () => {
    container = await renderContainer(
      { id: '123', match: 'KPI', group: 'checkbox', item: 'ITEMTYPE' },
      'basefilter',
    );
    const expected = {
      data: {
        id: '123',
        type: 'ITEMTYPE',
      },
      updateOperation: 'select-filter',
    };
    container.querySelector('eui-checkbox').click();
    expect(eventData.type).to.equal(UPDATE_FILTERS_EVENT);
    expect(eventData.detail).to.deep.equal(expected);
  });
});
