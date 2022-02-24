import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';
import 'help_in_responsive_widgets.dart';

PageView pageViewForFCFS() {
  return PageView(
    physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizedBoxForHeight(10),
          Text(
            "● First in, first out (FIFO), "
            "also known as first come, first served (FCFS),"
            " is the simplest scheduling algorithm.\n\n"
            "● FIFO simply queues processes in the order "
            "that they arrive in the ready queue.\n\n"
            "● In this, the process that comes first will be"
            " executed first and the next process starts only"
            " after the previous gets fully executed. ",
            style: TextStyle(color: Vx.white, fontSize: forHeight(19)),
          )
        ],
      ),
      Column()
    ],
  );
}
