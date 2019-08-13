import 'package:flutter/material.dart';

import 'package:my_app/views/login-screen/login-screen.dart';
import 'package:my_app/views/home-screen/home-screen.dart';
import 'package:my_app/views/survey-screen/survey-screen.dart';

const pageLogin = "/";

const pageHome = "/home";
const pageSurvey = "/survey";

final Map<String, WidgetBuilder> routes = {
  pageLogin: (context) => LoginScreen(),
  pageHome: (context) => HomeScreen(),
  pageSurvey: (context) => SurveyScreen(),
};

Route<dynamic> routeFactory(RouteSettings settings) {
  WidgetBuilder builder;
  print(settings.name);

  if (builder != null)
    return MaterialPageRoute(builder: builder, settings: settings);
  assert(false, 'ERROR: can not generate Route for ${settings.name}');
  return null;
}