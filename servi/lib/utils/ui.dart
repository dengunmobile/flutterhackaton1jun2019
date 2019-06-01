

import 'package:flutter/material.dart';
import 'constants.dart';



double getSizeScreenWidth(BuildContext context) {

  int lp = LayoutDimensions.leftPadding;
  int rp = LayoutDimensions.rightPadding;

  return MediaQuery.of(context).size.width - lp - rp;
}