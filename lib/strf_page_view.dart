import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';
import 'help_in_responsive_widgets.dart';

PageView pageViewForSRTF() {
  return PageView(
    physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizedBoxForHeight(10),
          Text(
            "● Shortest Remaining Time First is the pre-emptive "
            "version of Shortest Job First.\n\n"
            "● In the Shortest Remaining Time First (SRTF) scheduling "
            "algorithm, the process with the smallest amount of time "
            "remaining until completion is selected to execute.\n\n"
            "● The process is executed until it is completed or a new "
            "process is added that requires a smaller amount of time.",
            style: TextStyle(color: Vx.white, fontSize: forHeight(19)),
          )
        ],
      ),
      Column()
    ],
  );
}
