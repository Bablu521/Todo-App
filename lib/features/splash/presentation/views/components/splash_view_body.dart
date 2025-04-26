import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/colors.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 220,
        height: 220,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/to-do-list.png"),
            fit: BoxFit.fill,
          ),
          color: AppColors.blueBg,
        ),
      ),
    );
  }
}
