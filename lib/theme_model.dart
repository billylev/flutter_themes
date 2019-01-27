import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ThemeModel extends Model {
  ThemeData _theme;
  ThemeData get theme => _theme;

  void initTheme({Brightness brightness: Brightness.light}) {
    _theme = (brightness == Brightness.dark) ? ThemeData.dark() : ThemeData.light();
  }
  
  static ThemeModel of(BuildContext context) =>
      ScopedModel.of<ThemeModel>(context);

  void updateTheme(ThemeData newTheme) {
    _theme = newTheme;
    notifyListeners();
  }

  void updateProperty({String property, Color color}) {
    final args = <Symbol, dynamic>{};
    args[Symbol(property)] = color;
    final updatedTheme = Function.apply(theme.copyWith, null, args);
    updateTheme(updatedTheme);
  }

  TextTheme _buildDefaultTextTheme(TextTheme base) {
    return base.copyWith(
      headline: base.headline.copyWith(
        fontWeight: FontWeight.w500,
      ),
      title: base.title.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 30.0,
      ),
      caption: base.caption.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 14.0,
      ),
      body2: base.body2.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      ),
    );
  }
}
