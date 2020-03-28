import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_theme/dashboard.dart';
import 'package:flutter_theme/theme_model.dart';
import 'package:scoped_model/scoped_model.dart';

Future main() async {
  final themeModel = ThemeModel();
  themeModel.initTheme();

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) =>
          runApp(ScopedModel<ThemeModel>(model: themeModel, child: MyApp())));
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ThemeModel>(
        builder: (BuildContext context, Widget child, model) {
      return MaterialApp(
        theme: model.theme,
        home: Dashboard(),
      );
    });
  }
}
