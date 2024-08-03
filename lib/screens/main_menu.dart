import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/screens/players_names_screen.dart';
import 'package:flutter_tic_tac_toe/theme/colors.dart';
import 'package:flutter_tic_tac_toe/widgets/wrapper_container.dart';
import 'package:sizer/sizer.dart';

import 'game_base_screen.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WrapperContainer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Game X O',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 15.h),
              MainMenuButtons(
                btnText: 'Chơi Với Máy',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                       GameBaseScreen(
                        playerOName: "Máy",
                        playerXName: "Bạn",
                        isAgainstAI: true,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 2.h),
              MainMenuButtons(
                btnText: 'Chơi Hai Người',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PlayerNames()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainMenuButtons extends StatelessWidget {
  const MainMenuButtons(
      {super.key, required this.btnText, required this.onPressed});

  final String btnText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) =>
      SizedBox(
        width: 60.w,
        height: 8.h,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: GameColors.kForeground,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            btnText,
            style: TextStyle(
              color: GameColors.kWhitish,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
}
