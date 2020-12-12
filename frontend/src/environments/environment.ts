declare var require: any;

export const environment = {
  production: false,
  apiUrl: require('./../assets/.env.json').apiUrl
};
