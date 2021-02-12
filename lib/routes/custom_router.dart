import 'package:flutter/material.dart';
import 'package:multi_language/pages/about_page.dart';
import 'package:multi_language/pages/home_page.dart';
import 'package:multi_language/pages/not_found_page.dart';
import 'package:multi_language/pages/settings_page.dart';
import 'package:multi_language/routes/route_name.dart';

class CustomRouter{

  static Route<dynamic> allRoutes(RouteSettings settings){
    switch (settings.name) {
      case homeRoute:
      return MaterialPageRoute(builder: (_) => HomePage()); 

      case aboutRoute:
      return MaterialPageRoute(builder: (_) => AboutPage()); 

      case settingsRoute:
      return MaterialPageRoute(builder: (_) => SettingsPage());  
    }
    return MaterialPageRoute(builder: (_) => NotFoundPage());  
  }
}