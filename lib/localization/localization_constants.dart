import 'package:flutter/material.dart';
import 'package:multi_language/localization/demo_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

String getTranslated(BuildContext context, String key){

  return DemoLocalization.of(context).getTranslatedValues(key);
}

// LANGUAGE CODE

const String ENGLISH = 'en';
const String SPANISH = 'es';
const String CHINESE = 'zh';

const String LANGUAGE_CODE = 'languageCode';

Future<Locale> setLocale(String languageCode) async{
  SharedPreferences _prefs = await SharedPreferences.getInstance();

  await _prefs.setString(LANGUAGE_CODE, languageCode);

  return _locale(languageCode);

}

Locale _locale(String languageCode){
  Locale _temp;
    switch (languageCode) {
      case ENGLISH:
        _temp = Locale(languageCode, 'US');
        break;
      case SPANISH:
        _temp = Locale(languageCode, 'MX');
        break;
      case CHINESE:
        _temp = Locale(languageCode, 'CN');
        break;
      default:
        _temp = Locale(ENGLISH, 'US');
    }

    return _temp;
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LANGUAGE_CODE) ?? ENGLISH;
  return _locale(languageCode);
}