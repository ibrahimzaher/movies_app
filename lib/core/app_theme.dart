import 'package:flutter/material.dart';

const Color blackColor = Color(0xff121312);
const Color greyColor = Color(0xff707070);
const Color greyLightColor = Color(0xffC6C6C6);
const Color yellowColor = Color(0xffFFBB3B);
const Color whiteColor = Color(0xffffffff);
final appTheme = ThemeData(
  primaryColor: blackColor,
  scaffoldBackgroundColor: blackColor,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: blackColor,
    elevation: 20,
    selectedItemColor: yellowColor,
    type: BottomNavigationBarType.fixed,
    selectedLabelStyle: TextStyle(
      fontSize: 8,
      fontWeight: FontWeight.bold,
    ),
    unselectedItemColor: greyLightColor,
    unselectedLabelStyle: TextStyle(
      fontSize: 8,
      fontWeight: FontWeight.bold,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        10,
      ),
    ),
  ),
);
