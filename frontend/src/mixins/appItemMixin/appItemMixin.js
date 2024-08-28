import { html, classMap, nothing } from '@eui/lit-component';
import { Tooltip } from '@eui/base';
import { Icon } from '@eui/theme';
import CONSTANTS from '../../utils/constants';

const { LAST_OPENED, F_KEY } = CONSTANTS;

const appItemMixin = (Base) =>
  class extends Base {
    constructor() {
      super();
      this.handleFavoriteChange = this.handleFavoriteChange.bind(this);
      this.handleRecentAppChange = this.handleRecentAppChange.bind(this);
      this.handleLinkClick = this.handleLinkClick.bind(this);
    }

    static get components() {
      return {
        ...(super.components ?? {}),
        'eui-icon': Icon,
        'eui-tooltip': Tooltip,
      };
    }

    handleKeyboard(event) {
      super.handleKeyboard(event);
      if (event.key === F_KEY) {
        this.handleFavoriteChange(event);
      }
    }

    handleRecentAppChange() {
      const { appName } = this;
      this.bubble('app-status-change', {
        appName,
        changed: { [LAST_OPENED]: Date.now() },
      });
    }

    handleLinkClick() {
      // Required, as handling the click event happens before the native link gets the click event.
      // If the recent app list is changed during the click event, the cards are changed immediately
      // and a different native link will get the click event
      setTimeout(this.handleRecentAppChange, 10);
    }

    renderExternalIcon() {
      const { isExternal, i18n } = this;
      if (isExternal) {
        return html`
          <eui-tooltip class="external-icon" message="${i18n.EXTERNAL_APP_TOOLTIP}" position="top">
            <eui-icon
              class=${classMap({
                icon: true,
                pointer: true,
                'external-icon': true,
              })}
              name="launch"
            ></eui-icon>
          </eui-tooltip>
        `;
      }
      return nothing;
    }

    get menuItems() {
      const { descriptionShort, descriptionLong, i18n } = this;
      return [
        {
          label: i18n.VIEW_DESCRIPTION,
          tooltip: {
            content: this.renderTooltipContent(descriptionShort, descriptionLong),
          },
        },
        {
          label: i18n.FAVORITE,
          icon: this.getFavoriteIconParams(),
        },
      ];
    }
  };

export default appItemMixin;
