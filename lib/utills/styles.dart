import 'package:shopping_app/utills/size_config.dart';

import 'dimens.dart';
import 'imports.dart';
import 'colors.dart';

class AppTheme {
  AppTheme._();

  static const Color appBackgroundColor = Color(0xFFFFFFFF);
  static const Color topBarBackgroundColor = Color(0xFFFFD974);
  static const Color selectedTabBackgroundColor = Color(0xFFFFC442);
  static const Color unSelectedTabBackgroundColor = Color(0xFFFFFFFC);
  static const Color subTitleTextColor = Color(0xFF9F988F);

  static final ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      brightness: Brightness.light,
      textTheme: lightTextTheme,
      canvasColor: Colors.transparent,
      splashColor: Colors.transparent,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      accentColor: MyColors.blueColor,
      dividerColor: Color(0xff424242),
      hintColor: Colors.grey[500],
      primaryColor: Color(0xFFFFC442),
      primaryColorBrightness: Brightness.dark,
      primaryColorDark: topBarBackgroundColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          elevation:0.0,
          selectedIconTheme:IconThemeData(color: Colors.blueAccent,size: SizeConfig.sizes(Dimens.navIconsSize)),
          unselectedIconTheme:IconThemeData(color: Colors.blueAccent,size: SizeConfig.sizes(Dimens.navIconsSize)),
          selectedItemColor:Colors.blue,
          selectedLabelStyle:_headline4Light.copyWith(color: Colors.blue),
      ));


  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    textTheme: darkTextTheme,
    canvasColor: Colors.transparent,
    splashColor: Colors.transparent,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    accentColor: selectedTabBackgroundColor,
    dividerColor: Color(0xFFFFFFFF),
    hintColor: subTitleTextColor,
    primaryColor: Color(0xFFFFC442),
    primaryColorBrightness: Brightness.dark,
    primaryColorDark: topBarBackgroundColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.grey[800],
        elevation:0.0,
        selectedIconTheme:IconThemeData(color: Colors.blueAccent,size: SizeConfig.sizes(Dimens.navIconsSize)),
        unselectedIconTheme:IconThemeData(color: Colors.blueAccent,size: SizeConfig.sizes(Dimens.navIconsSize)),
        selectedItemColor:Colors.blue,
        selectedLabelStyle:_headline4Light.copyWith(color: Colors.blue),
        unselectedLabelStyle:_headline4Light.copyWith(color: Colors.white),
      )
  );

  /*---------------------------- L-I-G-H-T ---------------------------*/
  static final TextTheme lightTextTheme = TextTheme(
    button: _buttonLight,
    bodyText1: _selectedTabLight,
    bodyText2: _unSelectedTabLight,
    headline1: _headline1Light,
    headline2: _headline2Light,
    headline3: _headline3Light,
    headline4: _headline4Light,
    headline5: _headline5Light,
    headline6: _headline6Light,
    subtitle1: _subTitle1Light,
    subtitle2: _subTitle2Light,
  );

  static final TextStyle _headline1Light = TextStyle(
    color: Colors.black,
    fontSize: 3.57 * SizeConfig.textMultiplier,
  );

  static final TextStyle _headline2Light = TextStyle(
    color: Colors.black,
    fontSize: 2.68 * SizeConfig.textMultiplier,
  );

  static final TextStyle _headline3Light = TextStyle(
    color: Colors.black,
    fontSize: 2.32 * SizeConfig.textMultiplier,
  );

  static final TextStyle _headline4Light = TextStyle(
    color: Colors.black,
    fontSize: 1.78 * SizeConfig.textMultiplier,
  );

  static final TextStyle _headline5Light = TextStyle(
    color: Colors.black,
    fontSize: 1.43 * SizeConfig.textMultiplier,
  );

  static final TextStyle _headline6Light = TextStyle(
    color: Colors.black,
    fontSize: 1.25 * SizeConfig.textMultiplier,
  );

  static final TextStyle _subTitle1Light = TextStyle(
    color: subTitleTextColor,
    fontSize: 2 * SizeConfig.textMultiplier,
  );

  static final TextStyle _subTitle2Light = TextStyle(
    color: subTitleTextColor,
    fontSize: 1.5 * SizeConfig.textMultiplier,
  );

  static final TextStyle _buttonLight = TextStyle(
    color: Colors.black,
    fontSize: 2.5 * SizeConfig.textMultiplier,
  );

  static final TextStyle _greetingLight = TextStyle(
    color: Colors.black,
    fontSize: 2.0 * SizeConfig.textMultiplier,
  );

  static final TextStyle _searchLight = TextStyle(
    color: Colors.black,
    fontSize: 2.3 * SizeConfig.textMultiplier,
  );

  static final TextStyle _selectedTabLight = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 2 * SizeConfig.textMultiplier,
  );

  static final TextStyle _unSelectedTabLight = TextStyle(
    color: Colors.grey,
    fontSize: 2 * SizeConfig.textMultiplier,
  );

/*---------------------------- D-A-R-K ---------------------------*/
  static final TextTheme darkTextTheme = TextTheme(
    button: _buttonDark,
    bodyText1: _selectedTabDark,
    bodyText2: _unSelectedTabDark,
    headline1: _headline1Dark,
    headline2: _headline2Dark,
    headline3: _headline3Dark,
    headline4: _headline4Dark,
    headline5: _headline5Dark,
    headline6: _headline6Dark,
    subtitle1: _subTitle1Dark,
    subtitle2: _subTitle2Dark,
  );

  static final TextStyle _headline1Dark =
      _headline1Light.copyWith(color: Colors.white);
  static final TextStyle _headline2Dark =
      _headline2Light.copyWith(color: Colors.white);
  static final TextStyle _headline3Dark =
      _headline3Light.copyWith(color: Colors.white);
  static final TextStyle _headline4Dark =
      _headline4Light.copyWith(color: Colors.white);
  static final TextStyle _headline5Dark =
      _headline5Light.copyWith(color: Colors.white);
  static final TextStyle _headline6Dark =
      _headline6Light.copyWith(color: Colors.white);

  static final TextStyle _subTitle1Dark =
      _subTitle1Light.copyWith(color: Colors.white70);
  static final TextStyle _subTitle2Dark =
      _subTitle2Light.copyWith(color: Colors.white54);

  static final TextStyle _buttonDark =
      _buttonLight.copyWith(color: Colors.black);

  static final TextStyle _greetingDark =
      _greetingLight.copyWith(color: Colors.black);

  static final TextStyle _searchDark =
      _searchLight.copyWith(color: Colors.black);

  static final TextStyle _selectedTabDark =
      _selectedTabLight.copyWith(color: Colors.white);

  static final TextStyle _unSelectedTabDark =
      _selectedTabLight.copyWith(color: Colors.white70);
}
