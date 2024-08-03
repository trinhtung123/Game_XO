import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_tic_tac_toe/game_logic/check_result.dart';
import 'package:flutter_tic_tac_toe/providers/game_providers.dart';
import 'package:flutter_tic_tac_toe/screens/main_menu.dart';
import 'package:flutter_tic_tac_toe/theme/colors.dart';
import 'package:flutter_tic_tac_toe/widgets/alert.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widgets/history_modal.dart';
import 'game_screen.dart';

class GameBaseScreen extends HookWidget {
  GameBaseScreen({
    Key? key,
    required this.isAgainstAI,
    required this.playerXName,
    required this.playerOName,
  }) : super(key: key);

  final String playerXName;
  final String playerOName;
  final bool isAgainstAI;

  @override
  Widget build(BuildContext context){ 
     
        return Scaffold(
        appBar: AppBar(
          backgroundColor: GameColors.kGradient1,
          leading: IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => MainMenu()),
              (route) => false,
              );
              playerOScore = 0;
              playerXScore = 0;
            },
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: GameColors.kWhitish,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                buildHistoryBottomSheet(context);
              },
              icon: const Icon(
                Icons.history_outlined,
                color: GameColors.kWhitish,
              ),
            ),
          ],
        ),
        body: GameScreen(
          playerXName: playerXName,
          playerOName: playerOName,
          isAgainstAI: isAgainstAI,
        ),
      );
}
}