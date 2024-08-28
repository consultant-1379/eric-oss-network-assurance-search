import { expect, fixture, html, elementUpdated } from '@open-wc/testing';
import { ifDefined } from '@eui/lit-component';
import MetricBrowserTable from '../../../src/components/metric-browser-table/metric-browser-table.js';
import { nextTick } from '../../utils/utils';
import { constants } from '../../utils/constants.js';

const tableData = constants.MOCK_TABLE_DATA;

const columnInfo = constants.MOCK_TABLE_COLUMNS;

const actionInfo = constants.MOCK_TABLE_ACTIONS;

const rightClick = new MouseEvent('contextmenu', {
  bubbles: true,
  composed: true,
  button: 2, // 2 represents right-click
});

let eventData;
const handleEvent = (event) => {
  eventData = event;
};

export const renderMetricBrowserTable = async ({
  columns,
  data,
  currentpage,
  numpages,
  numentries,
  striped,
  actions,
  settings,
}) => {
  const metricBrowserTableTemplate = html`
    <e-metric-browser-table
      .columns=${ifDefined(columns)}
      .data=${ifDefined(data)}
      .currentpage=${ifDefined(currentpage)}
      .numentries=${ifDefined(numentries)}
      .numpages=${ifDefined(numpages)}
      .striped=${ifDefined(striped)}
      .actions=${ifDefined(actions)}
      .settings=${ifDefined(settings)}
      @table-actions=${handleEvent}
      @metric-search=${handleEvent}
    ></e-metric-browser-table>
  `;
  const element = await fixture(metricBrowserTableTemplate);
  await nextTick();
  return element;
};

const renderTableContainer = async (props) => {
  const element = await renderMetricBrowserTable(props);
  return element.shadowRoot.querySelector('eui-custom-table');
};

const renderPaginationContainer = async (props) => {
  const element = await renderMetricBrowserTable(props);
  return element.shadowRoot.querySelector('eui-pagination');
};

const getElementOnTable = async () => {
  const element = await renderMetricBrowserTable({
    columns: columnInfo,
    data: tableData,
    actions: actionInfo,
  });
  const table = element.shadowRoot.querySelector('eui-custom-table');
  const tableRow = table.shadowRoot.querySelector('tbody td');
  return { element, tableRow };
};

export const renderActionButton = async () => {
  const { tableRow, element } = await getElementOnTable();
  tableRow.click();
  await elementUpdated(element);
  return element.shadowRoot.querySelector('eui-button');
};

const renderContextMenu = async () => {
  const { tableRow, element } = await getElementOnTable();
  tableRow.dispatchEvent(rightClick);
  await elementUpdated(element);
  return element.shadowRoot.querySelectorAll('eui-menu eui-menu-item');
};

describe('MetricBrowserTable Component Tests', async () => {
  let tableContainer;
  let paginationContainer;

  before(async () => {
    MetricBrowserTable.register();
  });

  it('should render <e-metric-browser-table>', async () => {
    tableContainer = await renderTableContainer({
      columns: columnInfo,
      data: tableData,
      currentpage: 1,
      numpages: 1,
      numentries: 9,
    });
    expect(tableContainer).to.exist;
  });

  it('should have stripes', async () => {
    tableContainer = await renderTableContainer({
      columns: columnInfo,
      data: tableData,
      striped: true,
      currentpage: 1,
      numpages: 1,
      numentries: 9,
    });
    expect(tableContainer.striped).to.be.true;
  });

  it('should be sortable', async () => {
    tableContainer = await renderTableContainer({
      columns: columnInfo,
      data: tableData,
      currentpage: 1,
      numpages: 1,
      numentries: 9,
    });
    expect(tableContainer.sortable).to.be.true;
  });

  it('should be tiny', async () => {
    tableContainer = await renderTableContainer({
      columns: columnInfo,
      data: tableData,
      tiny: true,
      settings: { rowHeight: 'tiny' },
      currentpage: 1,
      numpages: 1,
      numentries: 9,
    });
    expect(tableContainer.tiny).to.be.true;
  });

  it('should be compact', async () => {
    tableContainer = await renderTableContainer({
      columns: columnInfo,
      data: tableData,
      settings: { rowHeight: 'compact' },
      currentpage: 1,
      numpages: 1,
      numentries: 9,
    });
    expect(tableContainer.compact).to.be.true;
  });

  it('should handle sort events', async () => {
    tableContainer = await renderTableContainer({
      columns: columnInfo,
      data: tableData,
      currentpage: 1,
      numpages: 1,
      numentries: 9,
    });
    const sortColumn = tableContainer.shadowRoot.getElementById('col1');
    sortColumn.click();
    expect(eventData.detail.sortBy).to.be.an('Object');
  });

  it('sort events should have sort details', async () => {
    tableContainer = await renderTableContainer({
      columns: columnInfo,
      data: tableData,
      currentpage: 1,
      numpages: 1,
      numentries: 9,
    });
    const sortColumn = tableContainer.shadowRoot.getElementById('col1');
    sortColumn.click();
    expect(eventData.detail).to.deep.equals({
      sortBy: {
        id: 'col1',
      },
      sortOrder: 'desc',
    });
  });

  it('should have pagination', async () => {
    paginationContainer = await renderPaginationContainer({
      columns: columnInfo,
      data: tableData,
      currentpage: 1,
      numpages: 1,
      numentries: 9,
    });
    expect(paginationContainer).to.exist;
  });

  it('should have numPages', async () => {
    paginationContainer = await renderPaginationContainer({
      columns: columnInfo,
      data: tableData,
      currentpage: 1,
      numpages: 1,
      numentries: 9,
    });
    expect(paginationContainer.getAttribute('num-pages')).to.equal('1');
  });

  it('should have currentPage', async () => {
    paginationContainer = await renderPaginationContainer({
      columns: columnInfo,
      data: tableData,
      currentpage: 1,
    });
    expect(paginationContainer.getAttribute('current-page')).to.equal('1');
  });
  it('should have numEntries', async () => {
    paginationContainer = await renderPaginationContainer({
      columns: columnInfo,
      data: tableData,
      currentpage: 1,
      numpages: 1,
      numentries: 10,
    });
    expect(paginationContainer.getAttribute('num-entries')).to.equal('10');
  });

  it('should handle next page events', async () => {
    paginationContainer = await renderPaginationContainer({
      columns: columnInfo,
      data: tableData,
      currentpage: 2,
      numentries: 5,
      numpages: 2,
    });
    const listItem = paginationContainer.shadowRoot.querySelector('li');
    listItem.click();
    expect(eventData.detail).to.be.an('Object');
  });

  it('page events should have page details', async () => {
    paginationContainer = await renderPaginationContainer({
      columns: columnInfo,
      data: tableData,
      currentpage: 2,
      numentries: 5,
      numpages: 2,
    });
    const listItem = paginationContainer.shadowRoot.querySelector('li');
    listItem.click();
    expect(eventData.detail).to.deep.equals({
      currentPage: 1,
      hasNextPage: true,
      hasPreviousPage: false,
      numEntries: 5,
      numPages: 2,
      pageClicked: 'left',
      sortBy: {
        id: 'col1',
      },
      sortOrder: 'desc',
    });
  });

  it('should show no results banner and no pager when there are no results', async () => {
    const element = await renderMetricBrowserTable({
      columns: columnInfo,
      data: [],
      currentpage: 1,
      numpages: 1,
      numentries: 0,
    });
    const banner = element.shadowRoot.querySelector('e-info-banner');
    expect(banner).to.exist;
  });

  it('should show error banner when table has no columns', async () => {
    const element = await renderMetricBrowserTable({
      columns: [],
      data: [],
      currentpage: 1,
      numpages: 1,
      numentries: 0,
    });
    const banner = element.shadowRoot.querySelector('e-error-banner');
    expect(banner).to.exist;
  });

  it('should show contextmenu on table right click', async () => {
    const menuItems = await renderContextMenu();
    expect(menuItems[0].label).to.equal('Historical Data');
  });

  it('should handle context menu events', async () => {
    const menuItems = await renderContextMenu();
    menuItems[1].click();
    expect(eventData.detail.context.id).to.equal('CID_1234');
  });

  it('should have selected row in context menu items event detail', async () => {
    const menuItems = await renderContextMenu();
    menuItems[1].click();
    expect(eventData.detail.row.col1.value).to.equal('Item 1');
  });
});
