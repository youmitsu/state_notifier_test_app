import 'package:flutter/material.dart';

import 'app_colors.dart';

mixin AppTheme {
  ThemeData get lightTheme;

  ThemeData get darkTheme;
}

class BaseTheme with AppTheme {
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
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ButtonColor.orange,
    ),
  );

  @override
  ThemeData get darkTheme => commonThemeData.copyWith(
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
          color: Colors.transparent,
          elevation: 0,
          textTheme: TextTheme(
            title: TextStyle(
              fontSize: 18,
              color: TextColor.white,
            ),
          ),
          iconTheme: IconThemeData(
            color: ButtonColor.white,
          ),
          actionsIconTheme: IconThemeData(
            color: ButtonColor.white,
          ),
        ),
      );

  @override
  ThemeData get lightTheme => commonThemeData.copyWith(
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          color: Colors.transparent,
          elevation: 0,
          textTheme: TextTheme(
            title: TextStyle(
              fontSize: 18,
              color: TextColor.black,
            ),
          ),
          iconTheme: IconThemeData(
            color: ButtonColor.black,
          ),
          actionsIconTheme: IconThemeData(
            color: ButtonColor.black,
          ),
        ),
      );
}

class WelcomeTheme extends BaseTheme {
  @override
  ThemeData get darkTheme => super.darkTheme.copyWith(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
        ),
      );

  @override
  ThemeData get lightTheme => super.lightTheme.copyWith(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
        ),
      );
}

class HomeTheme extends BaseTheme {
  @override
  ThemeData get darkTheme => super.darkTheme.copyWith(
        scaffoldBackgroundColor: BackgroundColor.dark,
      );

  @override
  ThemeData get lightTheme => super.lightTheme.copyWith(
        scaffoldBackgroundColor: BackgroundColor.light,
      );
}
