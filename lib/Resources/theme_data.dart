import 'package:flutter/material.dart';
import 'package:musicalNoteBook/Resources/text_style.dart';
import 'colours.dart';

class AppTheme{
  static ThemeData lightTheme = ThemeData(
      cardColor: White,

      colorScheme: ColorScheme.fromSeed(
        seedColor:  PrimaryGreen,
        brightness: Brightness.light,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(PrimaryGreen),
            overlayColor: MaterialStateProperty.all<Color>(PrimaryGreen),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Dimensions.BUTTON_RADIUS),
                    side: const BorderSide(color: PrimaryGreen)
                )
            )
        ),
      )
  );  ///Light Theme
}