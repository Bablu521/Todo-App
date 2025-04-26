import 'package:flutter/material.dart';
import 'package:todo_app/core/routes/app_router.dart';
import 'package:todo_app/features/splash/presentation/views/components/splash_view_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    goToHomeScreen();
  }
  goToHomeScreen(){
    Future.delayed(Duration(seconds: 3), () {
      if (mounted){
        Navigator.pushReplacementNamed(context, AppRouter.homeScreen);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashViewBody()
    );
  }
}
