import { sleep } from 'k6';

import { RANDOM_SLEEP_SECONDS_LIMIT } from './constants.js';

function sleepForRandomTime() {
  sleep(Math.random() * RANDOM_SLEEP_SECONDS_LIMIT);
}

function randomIntFromInterval(min, max) {
  return Math.floor(Math.random() * (max - min) + min);
}

function randomElementFromArray(arr) {
  return arr[randomIntFromInterval(0, arr.length)];
}

export { sleepForRandomTime, randomIntFromInterval, randomElementFromArray };
