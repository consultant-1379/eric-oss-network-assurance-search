import { expect, fixture, html } from '@open-wc/testing';
import { ifDefined } from '@eui/lit-component';
import CustomTable from '../../../src/components/custom-table/custom-table.js';
import { constants } from '../../utils/constants.js';
import { nextTick } from '../../utils/utils.js';

const tableData = constants.MOCK_TABLE_DATA;
const columnInfo = constants.MOCK_TABLE_COLUMNS;

const COLLECTION_PERIOD_SELECTOR = '.collection-period';
const COLLECTION_TIMESTAMPS_SELECTOR = '.collection-times li';
const FIRST_ROW_CELL_SELECTOR = 'tbody tr:first-child td';

const getCell = (row, element, index) => element.shadowRoot.querySelectorAll(row)[index];

describe('CustomTable Component Tests', () => {
  before(() => {
    CustomTable.register();
  });

  const renderContainer = async ({ columns, data }) => {
    const container = html`
      <e-custom-table .columns=${ifDefined(columns)} .data=${ifDefined(data)}></e-custom-table>
    `;

    const element = await fixture(container);
    await nextTick();
    return element;
  };

  describe('Basic component setup', () => {
    it('should render <e-custom-table>', async () => {
      const component = await renderContainer({ columns: columnInfo, data: tableData });
      const tableTag = component.shadowRoot.querySelector('table');
      expect(tableTag).to.exist;
    });

    it('should contain a tooltip with collection period when beginTimestamp is provided in the cell value', async () => {
      const component = await renderContainer({ columns: columnInfo, data: tableData });
      const cell = getCell(FIRST_ROW_CELL_SELECTOR, component, 1);

      const collectionPeriod = cell.querySelector(COLLECTION_PERIOD_SELECTOR);
      const collectionTimestamps = cell.querySelectorAll(COLLECTION_TIMESTAMPS_SELECTOR).length;

      expect(collectionPeriod).to.exist;
      expect(collectionTimestamps).to.equal(0);
    });

    it('should contain a tooltip with collection period when endTimestamp is provided in the cell value', async () => {
      const component = await renderContainer({ columns: columnInfo, data: tableData });
      const cell = getCell(FIRST_ROW_CELL_SELECTOR, component, 2);

      const collectionPeriod = cell.querySelector(COLLECTION_PERIOD_SELECTOR);
      const collectionTimestamps = cell.querySelectorAll(COLLECTION_TIMESTAMPS_SELECTOR).length;

      expect(collectionPeriod).to.exist;
      expect(collectionTimestamps).to.equal(0);
    });

    it('should contain a tooltip with collection period when beginTimestamp and endTimestamp is provided in the cell value', async () => {
      const component = await renderContainer({ columns: columnInfo, data: tableData });
      const cell = getCell(FIRST_ROW_CELL_SELECTOR, component, 3);

      const collectionPeriod = cell.querySelector(COLLECTION_PERIOD_SELECTOR);
      const collectionTimestamps = cell.querySelectorAll(COLLECTION_TIMESTAMPS_SELECTOR).length;

      expect(collectionPeriod).to.exist;
      expect(collectionTimestamps).to.equal(2);
    });

    it('should not contain a tooltip with a collection period when neither beginTimestamp or endTimestamp exists', async () => {
      const component = await renderContainer({ columns: columnInfo, data: tableData });
      const cell = getCell(FIRST_ROW_CELL_SELECTOR, component, 0);

      const collectionPeriod = cell.querySelector(COLLECTION_PERIOD_SELECTOR);
      const collectionTimestamps = cell.querySelector(COLLECTION_TIMESTAMPS_SELECTOR);

      expect(collectionPeriod).to.not.exist;
      expect(collectionTimestamps).to.not.exist;
    });

    it('should have N/A as cell value for empty string cell value', async () => {
      const component = await renderContainer({ columns: columnInfo, data: tableData });
      const cell = getCell('tbody tr:nth-child(10) td', component, 0);

      expect(cell.textContent.includes('N/A')).to.be.true;
    });

    it('should have N/A as cell value for absence of cell value', async () => {
      const component = await renderContainer({ columns: columnInfo, data: tableData });
      const cell = getCell('tbody tr:nth-child(10) td', component, 1);

      expect(cell.textContent.includes('N/A')).to.be.true;
    });

    it("shouldn't have N/A as cell value when there is a cell value", async () => {
      const component = await renderContainer({ columns: columnInfo, data: tableData });
      const cell = getCell(FIRST_ROW_CELL_SELECTOR, component, 0);

      expect(cell.textContent.includes('N/A')).to.be.false;
    });
  });
});
