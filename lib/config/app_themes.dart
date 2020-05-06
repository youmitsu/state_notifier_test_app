import 'package:flutter/material.dart';

abstract class AbstractTheme {
  ThemeData get lightTheme;

  ThemeData get darkTheme;
}

class BaseTheme extends AbstractTheme {
  static final commonThemeData = ThemeData(
    textTheme: TextTheme(
      title: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      subtitle: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
      headline: TextStyle(
        fontSize: 24,
      ),
      subhead: TextStyle(
        fontSize: 22,
      ),
      display1: TextStyle(
        fontSize: 20,
      ),
      display2: TextStyle(
        fontSize: 18,
      ),
      display3: TextStyle(
        fontSize: 16,
      ),
      display4: TextStyle(
        fontSize: 14,
      ),
      body1: TextStyle(
        fontSize: 12,
      ),
      body2: TextStyle(
        fontSize: 11,
      ),
      caption: TextStyle(
        fontSize: 10,
      ),
    ),
  );

  @override
  ThemeData get darkTheme => commonThemeData.copyWith(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
      );

  @override
  ThemeData get lightTheme => commonThemeData.copyWith(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.black,
      );
}

class WelcomeTheme extends BaseTheme {
  @override
  ThemeData get darkTheme => super.darkTheme.copyWith(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.transparent,
        ),
      );

  @override
  ThemeData get lightTheme => super.lightTheme.copyWith(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.transparent,
        ),
      );
}
