import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';
import 'help_in_responsive_widgets.dart';

PageView pageViewForPBS() {
  return PageView(
    physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizedBoxForHeight(10),
          Text(
            "● Priority scheduling is a non-pre-emptive algorithm "
            "and one of the most common scheduling algorithms in "
            "batch systems.\n\n"
            "● Each process is assigned first arrival time "
            "(less arrival time process first) if two processes have same arrival "
            "time, then compare to priorities (highest process first).\n\n"
            "● Also, if two processes have same priority then compare to "
            "process number (less process number first). This process is "
            "repeated while all process gets executed.",
            style: TextStyle(color: Vx.white, fontSize: forHeight(19)),
          )
        ],
      ),
      Column()
    ],
  );
}
