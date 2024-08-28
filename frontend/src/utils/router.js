class RouterWrapper {
  constructor() {
    this.routes = {};
    this.handleLocationChange = this.handleLocationChange.bind(this);

    document.addEventListener('location:change', this.handleLocationChange);
  }

  handleLocationChange(event) {
    const { appPath, query } = event.detail;
    const keys = Object.getOwnPropertySymbols(this.routes);
    keys.forEach((key) => this.routes[key](appPath, query));
  }

  get router() {
    const { Router } = window.EUI;
    return Router;
  }

  get queryParams() {
    return new Proxy(new URLSearchParams(window.location.hash.split('?')[1]), {
      get: (searchParams, prop) => searchParams.get(prop),
    });
  }
}

export default new RouterWrapper();
