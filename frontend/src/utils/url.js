function createUrlFromObject(params) {
  let url = params.host;
  if (params.port) {
    url = `${url}:${params.port}`;
  }
  if (params.path) {
    url = `${url}${params.path}`;
  }
  return new URL(url);
}

function decodeParam(param) {
  return JSON.parse(decodeURIComponent(param));
}

function encodeParam(param) {
  return encodeURIComponent(JSON.stringify(param));
}

function getURLSearchParams() {
  return new URL(window.location.toLocaleString()).searchParams;
}

function replaceURLSearchParams(params) {
  const url = new URL(window.location.toLocaleString());
  url.search = new URLSearchParams(params).toString();
  window.history.replaceState(null, document.title, url);
}

function urlSearchParamsToObject(urlSearchParams) {
  return Object.fromEntries(urlSearchParams);
}

const URLSearchParamsExist = getURLSearchParams().size > 0;

export {
  createUrlFromObject,
  decodeParam,
  encodeParam,
  getURLSearchParams,
  replaceURLSearchParams,
  urlSearchParamsToObject,
  URLSearchParamsExist,
};
