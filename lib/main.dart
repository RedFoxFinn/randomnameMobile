import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:randomname/app.dart';

var _backGround = Color(0xff333333);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) => runApp(
    MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: _backGround
      ),
      debugShowCheckedModeBanner: false,
      home: App(),
    )));
}