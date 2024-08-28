class AppError extends Error {
  constructor(errorCode, message, statusCode, errorName = undefined) {
    super(message);
    this.errorCode = errorCode;
    this.statusCode = statusCode;
    this.errorName = errorName;
  }

  setStatus(res) {
    res.status(this.statusCode);
    res.json({
      name: this.errorName,
      code: this.errorCode,
      message: this.message || 'Error',
    });
    return res;
  }
}

export { AppError };
