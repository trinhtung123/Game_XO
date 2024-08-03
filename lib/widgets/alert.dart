import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'button_widget.dart';

void showGameAlert(
    String message, BuildContext context, Function reset) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: GameColors.kLighterForeground,
        elevation: 0,
        title: const Text(
          "Thông Báo",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            
          ),
        ),
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            
          ),
        ),
        actions: [
         ButtonWidget(
            onPressed: () {
              Navigator.of(context).pop();
              reset();
            },
            text: 'Có',
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Không',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      );
    },
  );
}