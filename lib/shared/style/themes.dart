import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petopia/shared/style/colors.dart';


ThemeData darkTheme = ThemeData(
  textTheme: TextTheme(
      bodyLarge: TextStyle(fontSize: 18,color: Colors.white), // Change the color for bodyText1
    ),
    scaffoldBackgroundColor:HexColor('333739'),
    appBarTheme: AppBarTheme(
      systemOverlayStyle:SystemUiOverlayStyle(
        statusBarColor: HexColor('333739'),
        statusBarIconBrightness: Brightness.dark,
      ) ,
      backgroundColor: HexColor('333739'),
      actionsIconTheme:IconThemeData
        (
        color:Colors.white,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: defaultColor,
      unselectedItemColor:Colors.white,
      backgroundColor:HexColor('333739'),
      elevation: 20,
    )
) ;

ThemeData lightTheme = ThemeData(
  textTheme: TextTheme(
      bodyLarge: TextStyle(fontSize: 18,color: Colors.black, )// Change the color for bodyText1
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    systemOverlayStyle:SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.light,
    ) ,
    backgroundColor: Colors.white,
    actionsIconTheme:IconThemeData(
      color:Colors.black,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: defaultColor,
    backgroundColor: Colors.white,
    type: BottomNavigationBarType.fixed,
  ),
  colorScheme: ColorScheme.fromSeed(seedColor:defaultColor),
  useMaterial3: true,
);