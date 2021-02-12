import 'package:flutter/material.dart';
import 'package:multi_language/routes/route_name.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('About Page'),
      ),

      body: Container(),
    );
  }
}