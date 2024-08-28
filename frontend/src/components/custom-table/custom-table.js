import dayjs from 'dayjs';
import utc from 'dayjs/plugin/utc';
import LocalizedFormat from 'dayjs/plugin/localizedFormat';
import { Table } from '@eui/table';
import { definition, html, nothing } from '@eui/lit-component';
import { Icon } from '@eui/theme';
import { Tooltip } from '@eui/base';
import style from './custom-table.css';
import { toTableValue } from '../../utils/decimalFormatter';

dayjs.extend(LocalizedFormat);
dayjs.extend(utc);

export default class CustomTable extends Table {
  get meta() {
    return import.meta;
  }

  static get components() {
    return {
      'eui-tooltip': Tooltip,
      'eui-icon': Icon,
    };
  }

  // Day js time function to get UTC timestamp in local time with offset
  _makeTimestamp = (time) =>
    dayjs(time * 1000)
      .utc()
      .local()
      .format('LL LTS');

  // Helper function to create the list items for collection period
  _makeTimeEntry = (label, value) => html`
    <li>
      <strong>${label}</strong>
      ${this._makeTimestamp(value)}
    </li>
  `;

  // Time list item fields for collection period
  _beginAndEndItems = (begin, end) => html`
    ${this._makeTimeEntry(this.i18n?.COLLECTION_START || 'Begin Time: ', begin)}
    ${this._makeTimeEntry(this.i18n?.COLLECTION_END || 'End Time: ', end)}
  `;

  /* Add collection period section when there is a beginning or end timestamp (or both)
   * @function _collectionPeriod
   * @param {Object} cell - Row cell data.
   * @returns the collection period section or nothing if no time is provided.
   */
  _collectionPeriod = ({ beginTimestamp, endTimestamp }) => {
    const timeCollected = beginTimestamp || endTimestamp;
    const showBeginningAndEnd = beginTimestamp && endTimestamp && beginTimestamp !== endTimestamp;

    if (!timeCollected) {
      return nothing;
    }

    return html`
      <section class="collection-period">
        <strong>${this.i18n?.COLLECTION_LABEL || 'Collection Period'}</strong>
        <ul class="collection-times">
          ${showBeginningAndEnd
            ? this._beginAndEndItems(beginTimestamp, endTimestamp)
            : this._makeTimestamp(timeCollected)}
        </ul>
      </section>
    `;
  };

  /**
   * Override cell from base class. Called each time a cell should be rendered.
   *
   * @function cell
   * @param {Object} row - Row data.
   * @param {Object} column - Column definition.
   * @returns contents of cell.
   */
  cell(row, column) {
    const unavailableLabel = this.i18n?.NOT_AVAILABLE || 'N/A';
    const originalValue = row[column?.attribute]?.value;
    const tooltipValue = originalValue || unavailableLabel;

    let cellValue;
    if (originalValue) {
      cellValue = ['float'].includes(column?.valueType)
        ? toTableValue(originalValue)
        : originalValue;
    } else {
      cellValue = unavailableLabel;
    }

    return html`
      <div class="custom-table__cell">
        <eui-tooltip position="top">
          ${cellValue}
          <div slot="message">
            <div>${column.title}</div>
            <strong class="cell-value">${tooltipValue}</strong>
            ${this._collectionPeriod(row[column?.attribute])}
          </div>
        </eui-tooltip>
      </div>
    `;
  }
}

definition('e-custom-table', {
  style,
})(CustomTable);
