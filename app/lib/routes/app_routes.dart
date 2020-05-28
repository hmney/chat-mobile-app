enum APP_ROUTE {SPLASH_SCREEN, GET_STARTED, AUTHENTICATION, HOME}

String pathForRoute(APP_ROUTE route) {
  switch (route) {
    case APP_ROUTE.GET_STARTED:
      return "/get_started";
    case APP_ROUTE.AUTHENTICATION:
      return "/login";
    case APP_ROUTE.HOME:
      return "/home";
    case APP_ROUTE.SPLASH_SCREEN:
    default:
      return "/";
  }
}