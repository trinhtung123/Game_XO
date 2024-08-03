import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/model/history_hive_model.dart';
import 'package:flutter_tic_tac_toe/storage/history_box.dart';
import 'package:flutter_tic_tac_toe/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class HistoryListView extends StatelessWidget {
  const HistoryListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<HistoryModelHive> historyList = HistoryBox.getHistory();

    historyList.sort((a, b) => b.date.compareTo(a.date));
    return Scaffold(
      backgroundColor: GameColors.kLighterForeground,
      body: historyList.isEmpty
          ? Center(
              child: Text(
                'Không có lịch sử',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                 
                ),
              ),
            )
          : CustomScrollView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) => Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 4,
                            blurRadius: 4,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              width: 2.1.w,
                              height: 10.h,
                              decoration: BoxDecoration(
                                color: historyList[index].winner == 'X'
                                    ? GameColors.kBlue
                                    : historyList[index].winner == 'draw'
                                        ? GameColors.kGrey
                                        : GameColors.kPurple,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  bottomLeft: Radius.circular(50),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 30),
                                child: Column(
                                  children: [
                                    Text(
                                      DateFormat('dd/MM/yyyy, HH:mm').format(
                                          historyList[index].date.toLocal()),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                       
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          historyList[index].playerXName,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: GameColors.kBlue,
                                            
                                          ),
                                        ),
                                        Text(
                                          "VS",
                                          style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                           
                                          ),
                                        ),
                                        Text(
                                          historyList[index].playerOName,
                                          style: TextStyle(
                                            color: GameColors.kPurple,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    childCount: historyList.length,
                  ),
                ),
              ],
            ),
    );
  }
}
