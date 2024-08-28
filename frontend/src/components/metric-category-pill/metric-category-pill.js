/**
 * Component MetricCategoryPill is defined as
 * `<e-metric-category-pill>`
 *
 * @extends {LitComponent}
 */
import { definition } from '@eui/lit-component';
import { Pill } from '@eui/base';
import style from './metric-category-pill.css';

export default class MetricCategoryPill extends Pill {
  /**
   * Overrides the handleEvent() method of the EUI-SDK Pill component.
   * For the metric category pill sorting to function properly, this
   * method needs to do nothing.
   */
  handleEvent() {}
}

definition('e-metric-category-pill', {
  style,
  props: {
    unselected: { attribute: true, type: Boolean },
  },
})(MetricCategoryPill);
