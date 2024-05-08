enum Flavor {
  dev,
  stg,
  prod,
}

class FFConstant {
  static const API_KEY = '1d1999e34a784346af18e9e5bb795c3d';
  static const BASE_URL = 'api.spoonacular.com';
}

class FFEndPoint {
  static const GET_RECIPES = '/recipes/complexSearch';
}
