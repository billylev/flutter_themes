# flutter_theme

The app lets you change the theme colors so you can explore how those colors affect an application and its widgets. To make those changes affect the app dynamically, I used scoped model which allows the child widgets to make changes to the theme colors and they are updated dynamically in the app. 

Check out the <a href="https://pub.dartlang.org/packages/scoped_model">Scoped Model</a> project page. 

## Adding a Theme

### Step one - Create the model

Firstly we need to define a model, that holds the ThemeData. 

```
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
}
```

Here we just create a default light or dark theme, store it in the model and we have helper functions to update the theme and the color properties. 

### Step two - Setup the Material App to use the model

We setup the MaterialApp to use the theme in our model. 

```
Future main() async {

  final themeModel = ThemeModel();
  themeModel.initTheme();

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
```

### Step three - Change the colors

To change a theme color, just tell the model which color to change, and it gets applied at runtime to the app. 

```
ThemeModel.of(context).updateProperty(property: "primaryColor", color: Colors.green);
```

### Final word

There is more to themes that just the colors. There is a whole host of options available including 

1. Text 
2. Button 
3. Icon 
4. Input
5. Slider
6. Chips
7. Dialogs 

A project thats a must see, to get a fuller understanding of themes is <a href="https://github.com/rxlabz/panache">Flutter Material Theme Editor</a>. This project lets you set and explore a whole host of theme settings, and export the theme to add to your application. 
