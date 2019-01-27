import 'package:flutter/material.dart';
import 'package:flutter_theme/main.dart';
import 'package:flutter_theme/theme_model.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:scoped_model/scoped_model.dart';

class DashboardPage1 extends StatefulWidget {
  @override
  DashboardPage1State createState() {
    return new DashboardPage1State();
  }
}

class DashboardPage1State extends State<DashboardPage1> {

  Color _pickerColor = Color(0xffFFFFFF);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ThemeModel>(
        builder: (BuildContext context, Widget child, model) {
          return
           Container(child: ListView(children: [
      _buildColorWidget(context, model.theme.primaryColor, _textColor(model.theme.primaryColor), "primaryColor"),
      _buildColorWidget(context, model.theme.primaryColorLight, _textColor(model.theme.primaryColorLight), "primaryColorLight"),
      _buildColorWidget(context, model.theme.primaryColorDark, _textColor(model.theme.primaryColorDark), "primaryColorDark"),
      _buildColorWidget(context, model.theme.accentColor, _textColor(model.theme.accentColor), "accentColor"),
      _buildColorWidget(context, model.theme.indicatorColor, _textColor(model.theme.indicatorColor), "indicatorColor"),
      _buildColorWidget(context, model.theme.backgroundColor, _textColor(model.theme.backgroundColor), "backgroundColor"),
      _buildColorWidget(context, model.theme.scaffoldBackgroundColor, _textColor(model.theme.scaffoldBackgroundColor), "scaffoldBackgroundColor"),
      _buildColorWidget(context, model.theme.cardColor, _textColor(model.theme.cardColor), "cardColor"),
      _buildColorWidget(context, model.theme.dialogBackgroundColor, _textColor(model.theme.dialogBackgroundColor), "dialogBackgroundColor"),
      _buildColorWidget(context, model.theme.dividerColor, _textColor(model.theme.dividerColor), "dividerColor"),
      _buildColorWidget(context, model.theme.errorColor, _textColor(model.theme.errorColor), "errorColor"),
      _buildColorWidget(context, model.theme.textSelectionColor, _textColor(model.theme.textSelectionColor), "textSelectionColor"),
      _buildColorWidget(context, model.theme.textSelectionHandleColor, _textColor(model.theme.textSelectionHandleColor), "textSelectionHandleColor"),
      _buildColorWidget(context, model.theme.buttonColor, _textColor(model.theme.buttonColor), "buttonColor"),
      _buildColorWidget(context, model.theme.selectedRowColor, _textColor(model.theme.selectedRowColor), "selectedRowColor"),
      _buildColorWidget(context, model.theme.highlightColor, _textColor(model.theme.highlightColor), "highlightColor"),
      _buildColorWidget(context, model.theme.hintColor, _textColor(model.theme.hintColor), "hintColor"),
      _buildColorWidget(context, model.theme.splashColor, _textColor(model.theme.splashColor), "splashColor"),
      _buildColorWidget(context, model.theme.canvasColor, _textColor(model.theme.canvasColor), "canvasColor")
    ]));
        });
  }

  changeSimpleColor(Color color) {
    _pickerColor = color;
  }

  Future _handleTap(String changingParam, Color currColor, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.all(0.0),
          contentPadding: EdgeInsets.all(0.0),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: currColor,
              onColorChanged: changeSimpleColor,
              colorPickerWidth: 1000.0,
              pickerAreaHeightPercent: 0.7,
              enableAlpha: true,
            ),
          ),
            actions: <Widget>[
              FlatButton(
                child: Text('Save'),
                onPressed: () {
                  if (changingParam == "buttonColor") {
                    ThemeModel.of(context).updateTheme(ThemeModel.of(context).theme.copyWith(
                        buttonColor: _pickerColor,
                        buttonTheme: ThemeModel.of(context).theme.buttonTheme.copyWith(buttonColor: _pickerColor)));
                  }
                  else {
                    ThemeModel.of(context).updateProperty(
                        property: changingParam, color: _pickerColor);
                  }
                  Navigator.of(context).pop();
                },
              ),
            ]
        );
      },
    );
  }

  Widget _buildColorWidget(BuildContext context, Color backgroundColor,
          Color textColor, String text) =>
            GestureDetector(
              onTap: ()  {
                _handleTap(text, backgroundColor, context);
              },
              child: Container(
                alignment: Alignment.center,
                height: 56.0,
                color: backgroundColor,
                child: Text(text,
                  style: Theme.of(context)
                      .textTheme
                      .body2
                      .copyWith(color: textColor))));

  Color _textColor(final Color color) {
    final Y = 0.2126*color.red + 0.7152*color.green + 0.0722*color.blue;
    return Y < 128 ? Colors.white : Colors.black;
  }

}
