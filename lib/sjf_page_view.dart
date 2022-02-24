import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';
import 'help_in_responsive_widgets.dart';

PageView pageViewForSJF() {
  return PageView(
    physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizedBoxForHeight(10),
          Text(
            "● Shortest job first (SJF) is also known as shortest job next.\n\n"
            "● Shortest Job First is a non-pre-emptive algorithm.\n\n"
            "● It selects the waiting process with the smallest execution time to execute next.",
            style: TextStyle(color: Vx.white, fontSize: forHeight(19)),
          )
        ],
      ),
      Column()
    ],
  );
}
