import 'package:flutter/material.dart';
import 'package:multi_language/main.dart';
import 'package:multi_language/classes/language.dart';
import 'package:multi_language/routes/route_name.dart';
import 'package:multi_language/localization/localization_constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  void _showSuccessDialog() {
    showTimePicker(context: context, initialTime: TimeOfDay.now());
  }

  void _changeLanguage(Language language) async{
    Locale _temp = await setLocale(language.languageCode);
    
    MyApp.setLocale(context, _temp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _drawerList(),
      appBar: AppBar(
        centerTitle: false,
        title: Text(getTranslated(context, 'home_page')),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: DropdownButton(
              underline: SizedBox(),
              icon: Icon(
                Icons.language,
                color: Colors.white,
              ),
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>((lang) => DropdownMenuItem(
                        value: lang,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(lang.flag),
                            Text(lang.name),
                          ],
                        ),
                      ))
                  .toList(),
              onChanged: (Language language) {
                _changeLanguage(language);
              },
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: _mainForm(context),
      ),
    );
  }

  Form _mainForm(BuildContext context) {
    return Form(
      key: _key,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Center(
                child: Text(
                  getTranslated(context, 'personal_info'),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            TextFormField(
              validator: (val) {
                if (val.isEmpty) {
                  return getTranslated(context, 'required_field');
                }

                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: getTranslated(context, 'name'),
                hintText: getTranslated(context, 'name_hint'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: (val) {
                if (val.isEmpty) {
                  return getTranslated(context, 'required_field');
                }

                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: getTranslated(context, 'email'),
                hintText: getTranslated(context, 'email_hint'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: getTranslated(context, 'date_of_birth')),
              onTap: () async {
                FocusScope.of(context).requestFocus(FocusNode());
                await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(DateTime.now().year),
                    lastDate: DateTime(DateTime.now().year + 20));
              },
            ),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
              onPressed: () {
                if (_key.currentState.validate()) {
                  _showSuccessDialog();
                }
              },
              height: 50,
              shape: StadiumBorder(),
              color: Theme.of(context).primaryColor,
              child: Center(
                child: Text(
                  getTranslated(context, 'submit_info'),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _drawerList() {
    TextStyle _textSyle = TextStyle(
      color: Colors.white,
      fontSize: 20,
    );
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      color: Theme.of(context).primaryColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Container(
              height: 100,
              child: CircleAvatar(),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.info,
              color: Colors.white,
              size: 30,
            ),
            title: Text(
              getTranslated(context, 'about_us'),
              style: _textSyle,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, aboutRoute);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.white,
              size: 30,
            ),
            title: Text(
              getTranslated(context, 'settings'),
              style: _textSyle,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, settingsRoute);
            },
          ),
        ],
      ),
    );
  }
}
