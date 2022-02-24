import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';
import 'help_in_responsive_widgets.dart';

PageView pageViewForRRS() {
  return PageView(
    physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizedBoxForHeight(10),
          Text(
            "● It is simple, easy to implement, and "
            "starvation-free as all processes get a fair share of CPU.\n\n"
            "● It is preemptive as processes are assigned CPU only for a "
            "fixed slice of time at most.\n\n"
            "● Round Robin is a CPU scheduling algorithm where "
            "each process is assigned a fixed time slot in a cyclic way.",
            style: TextStyle(color: Vx.white, fontSize: forHeight(19)),
          )
        ],
      ),
      Column()
    ],
  );
}
