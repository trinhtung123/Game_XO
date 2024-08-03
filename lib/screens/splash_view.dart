import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/screens/main_menu.dart';
import 'package:flutter_tic_tac_toe/theme/colors.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      // Chuyển đến màn hình chính sau 2 giây
      navigateToMainScreen();
    });
  }

  void navigateToMainScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainMenu()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GameColors.kForeground,
      body:  Center(
        child: Container(
       child: Image.asset(
          'assets/images/splash.png',
          width: 200,
          height: 200,
        ),
        ),
      ),
    );
  }
}