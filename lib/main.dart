import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:multi_language/routes/custom_router.dart';
import 'package:multi_language/routes/route_name.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: [
        Locale('en', 'US'),
        Locale('es', 'MX'), // Español
   /*      Locale('zh', 'CN'), // Chino
        Locale('ja', 'JP'), // Japones
        Locale('fr', 'FR'), // Frances
        Locale('ru', 'RU'), // Ruso
        Locale('nl', 'NL'), // Holandes
        Locale('de', 'DE'), // Aleman
        Locale('it', 'IT'), // Italiano
        Locale('pt', 'PT'), // Portugues
        Locale('ar', 'SA'), // Arabe
        Locale('hi', 'IN'), // Hindi */
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      title: 'Multi Language',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: CustomRouter.allRoutes,
      initialRoute: homeRoute,
    );
  }
}
