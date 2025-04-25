import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/colors.dart';

abstract class AppStyles {
  static const TextStyle style30 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w500,
    fontFamily: "Montserrat-SemiBold",
    color: Colors.black,
  );
  static const TextStyle style22 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    fontFamily: "Montserrat-SemiBold",
    color: Color.fromARGB(255, 23, 107, 122),
  );
  static TextStyle style14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: "Montserrat-Medium",
    color: Color.fromARGB(122, 37, 78, 86),
  );
  static TextStyle style18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: "Montserrat-SemiBold",
    color: AppColors.updateColor,
  );
}
