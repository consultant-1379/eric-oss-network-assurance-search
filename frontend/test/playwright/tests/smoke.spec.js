import { test, expect } from '@playwright/test';

const applicationUrl = 'http://localhost:3000/ui';

const developmentMode = true;
const waitForPageToLoadTimeout = 30000;

test.describe(() => {
  test.describe.configure({ retries: developmentMode ? 0 : 3 });

  test.beforeEach(async ({ page }) => {
    await page.goto(applicationUrl);
  });

  test('Webpage has correct title', async ({ page }) => {
    // Expect a title "to contain" a substring.
    await expect(page).toHaveTitle(/Service Assurance Dashboard/);
  });

  test('Can add a new KPI context to the Metric Browser', async ({ page }) => {
    // Making sure the "Add KPI Context" Button is visible
    let counter = 0;
    while (counter < 3) {
      /* eslint-disable-next-line no-await-in-loop */
      if ((await page.$('#add-kpi-context')) === null) {
        page.reload();
        // Waiting for the table to be visible
        const metricTable = page.getByRole('table');
        /* eslint-disable-next-line no-await-in-loop */
        await expect(metricTable).toBeVisible({ timeout: waitForPageToLoadTimeout });
      }
      counter += 1;
    }

    // Clicking "Add KPI Context" Button
    const addKpiContextButton = page.locator('#add-kpi-context');
    await addKpiContextButton.click();

    // Waiting for side panel to appear
    await expect(
      page.locator('#flyout div').filter({ hasText: 'Add KPI Context' }).nth(3),
    ).toBeVisible();

    // Clicking on the first option in the list of KPI Contexts
    await page.locator('eui-tree-item:nth-child(1) > .tree__item > .tree__item__span').click();

    // Waiting for 3 seconds
    await page.waitForTimeout(3000);

    // Clicking the "Add" button
    await page
      .getByRole('button', { name: 'Add', exact: true })
      .click({ timeout: waitForPageToLoadTimeout });

    // Expecting a new tab to be shown
    await expect(page.locator('eui-tab:nth-child(2)')).toBeVisible();
  });

  test('Can navigate to a new KPI Context via the context menu', async ({ page }) => {
    // Waiting for the table to be visible
    const metricTable = page.getByRole('table');
    await expect(metricTable).toBeVisible({ timeout: waitForPageToLoadTimeout });

    // Right clicking on the first row of the table
    await page
      .locator(
        'e-metric-browser:nth-child(2) > eui-multi-panel-tile > section > e-metric-browser-table > .metrics-table > .table__container > .table__viewport > table > .contextmenu > tr:nth-child(1)',
      )
      .first()
      .click({ button: 'right' });

    // Clicking on the first list item of the context menu
    await page
      .locator(
        'e-metric-browser:nth-child(2) > eui-multi-panel-tile > section > e-metric-browser-table > .metrics-table > eui-menu > eui-menu-item:nth-child(1)',
      )
      .first()
      .click();

    // Expecting a new tab to be shown
    await expect(page.locator('eui-tab:nth-child(2)')).toBeVisible();
  });
});
