import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:multi_language/localization/demo_localization.dart';
import 'package:multi_language/localization/localization_constants.dart';
import 'package:multi_language/routes/custom_router.dart';
import 'package:multi_language/routes/route_name.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  
  static void setLocale(BuildContext context, Locale locale){
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(locale);

  }
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;


  void setLocale(Locale locale){
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    if(_locale == null){
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else{
      return MaterialApp(
      supportedLocales: [
        Locale('en', 'US'),
        Locale('es', 'MX'), // Español
        Locale('zh', 'CN'), // Chino
    /*  Locale('ja', 'JP'), // Japones
        Locale('fr', 'FR'), // Frances
        Locale('ru', 'RU'), // Ruso
        Locale('nl', 'NL'), // Holandes
        Locale('de', 'DE'), // Aleman
        Locale('it', 'IT'), // Italiano
        Locale('pt', 'PT'), // Portugues
        Locale('ar', 'SA'), // Arabe
        Locale('hi', 'IN'), // Hindi */
      ],
      locale: _locale,
      localizationsDelegates: [
        DemoLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (deviceLocale, supportedLocale){
        for(var locale in supportedLocale) {
          if (locale.languageCode == deviceLocale.languageCode && locale.countryCode == deviceLocale.countryCode) {
            return locale;
            
          }          
        }
        return supportedLocale.first;
      },
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
}
