const MAX_ID_LENGTH = 16;
const MAX_NAME_LENGTH = 25;

function getRandomInt(min, max) {
  return Math.floor(Math.random() * (Math.floor(max) - Math.ceil(min) + 1)) + Math.ceil(min);
}

function getRandomString(maxLength) {
  let result = '';
  const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  const charactersLength = characters.length;
  const length = getRandomInt(1, maxLength);
  for (let i = 0; i < length; i += 1) {
    result += characters.charAt(Math.floor(Math.random() * charactersLength));
  }
  return result;
}

function getRandomDateInPast(startDate = new Date(2020, 0, 1), endDate = new Date()) {
  const dateObj = new Date(
    startDate.getTime() + Math.random() * (endDate.getTime() - startDate.getTime()),
  );
  return Math.floor(dateObj.getTime() / 1000);
}

function generateRandomId() {
  return getRandomString(MAX_ID_LENGTH);
}

function generateRandomName() {
  return getRandomString(MAX_NAME_LENGTH);
}

export { getRandomInt, getRandomString, getRandomDateInPast, generateRandomId, generateRandomName };
