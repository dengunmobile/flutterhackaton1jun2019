
import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData appTheme() {
  return ThemeData(
    primarySwatch: Colors.blue,
    backgroundColor: AppColors.backgroundColor,
    //primaryColor: Color.fromARGB(103, 125, 141, 1)
  );
}

TextStyle bottomTabTextStyle() {
  return TextStyle(
      fontSize: 10,
      color: AppColors.blackTextColor1,
      fontFamily: "Roboto",
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400
  );
}