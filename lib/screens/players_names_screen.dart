import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_tic_tac_toe/theme/colors.dart';
import 'package:flutter_tic_tac_toe/widgets/button_widget.dart';
import 'package:sizer/sizer.dart';

import '../widgets/wrapper_container.dart';
import 'game_base_screen.dart';

class PlayerNames extends HookWidget {
  const PlayerNames({super.key});

  Widget buildTextField(String hintText, IconData icon, bool isX,
          ValueSetter<String> onChanged, TextEditingController controller) =>
      TextField(
        cursorColor: isX ? GameColors.kWhitish : GameColors.kPurple,
        style: const TextStyle(
          color: GameColors.kWhitish,
        ),
        controller: controller,
        onChanged: onChanged,
        maxLength: 10,
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(3.w)),
          ),
          fillColor: GameColors.kForeground,
          hintText: hintText,
          hintStyle: const TextStyle(color: GameColors.kBackground),
          prefixIcon: Icon(
            icon,
            color: isX ? GameColors.kBlue : GameColors.kPurple,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final playerXController = useTextEditingController();
    final playerOController = useTextEditingController();
    final isBtnEnabled = useValueNotifier(false);
    void checkFields() {
      isBtnEnabled.value = playerXController.text.isNotEmpty &&
          playerOController.text.isNotEmpty;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: GameColors.kGradient1,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: GameColors.kWhitish,
          ),
        ),
      ),
      body: WrapperContainer(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Nhập Tên Người Chơi',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  
                ),
              ),
              SizedBox(
                height: 7.h,
              ),
              buildTextField('Nhập tên người chơi 1', Icons.close, true, (value) {
                checkFields();
              }, playerXController),
              SizedBox(
                height: 2.h,
              ),
              buildTextField('Nhập tên người chơi 2', Icons.circle_outlined, false, (value) {
                checkFields();
              }, playerOController),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                width: double.infinity,
                child: HookBuilder(builder: (context) {
                  final isEnabled = useValueListenable(isBtnEnabled);
                  return ButtonWidget(
                      isEnabled: isEnabled,
                      onPressed: () {
                        if (playerXController.text.toLowerCase().trim() ==
                            playerOController.text.toLowerCase().trim()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: GameColors.kForeground,
                              content: Text(
                                'Tên hai người chơi trùng nhau, vui lòng nhập lại',
                                style: TextStyle(
                                  color: GameColors.kWhitish,
                                ),
                              ),
                            ),
                          );

                          return;
                        }

                        FocusScope.of(context).unfocus(
                            disposition:
                                UnfocusDisposition.previouslyFocusedChild);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GameBaseScreen(
                              playerOName:
                                  playerOController.text.toLowerCase().trim(),
                              playerXName:
                                  playerXController.text.toLowerCase().trim(),
                              isAgainstAI: false,
                            ),
                          ),
                        );
                      },
                      text: 'Bắt Đầu');
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
