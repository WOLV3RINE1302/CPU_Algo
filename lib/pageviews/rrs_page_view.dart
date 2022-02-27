import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../main.dart';
import '../model/SJF_model.dart';
import '../model/color_model.dart';
import '../pages/rrs_table_class.dart';
import '../pages/sjf_table_class.dart';
import '../widget/help_in_responsive_widgets.dart';

class RRSPageView extends StatefulWidget {
  RRSPageView({Key? key}) : super(key: key);

  @override
  State<RRSPageView> createState() => _RRSPageViewState();
}

class _RRSPageViewState extends State<RRSPageView> {
  int length = 1;
  @override
  Widget build(BuildContext context) {
    bool isOn = SJFModel.ioSwitch;
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
        ListView(
          physics:
              AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          children: [
            sizedBoxForHeight(30),
            Row(
              children: [
                Text(
                  "I/O Burst",
                  style: TextStyle(
                      color: Vx.white,
                      fontWeight: FontWeight.w600,
                      fontSize: forHeight(16)),
                ).pOnly(left: forWidth(10)),
                Switch(
                  value: SJFModel.ioSwitch,
                  activeColor: ColorModel().green,
                  inactiveTrackColor: Color.fromARGB(255, 75, 75, 75),
                  onChanged: (val) {
                    setState(() {
                      SJFModel.ioSwitch = val;
                    });
                  },
                ).objectBottomLeft(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: forHeight(57),
                  width: !isOn ? width * 30 : width * 18,
                  child: Text(
                    "P-ID",
                    style: TextStyle(
                        color: Vx.black,
                        fontWeight: FontWeight.w600,
                        fontSize: forHeight(16)),
                  ).centered(),
                  decoration: BoxDecoration(
                    color: ColorModel().green,
                    border: Border(
                        right: BorderSide(
                      width: forHeight(2),
                      color: Vx.black,
                    )),
                  ),
                ),
                Container(
                  height: forHeight(57),
                  width: !isOn ? width * 30 : width * 18,
                  child: Text(
                    "AT",
                    style: TextStyle(
                        color: Vx.black,
                        fontWeight: FontWeight.w600,
                        fontSize: forHeight(16)),
                  ).centered(),
                  color: ColorModel().green,
                ),
                Container(
                  height: forHeight(57),
                  width: !isOn ? width * 30 : width * 18,
                  child: Text(
                    "CPU\nBurst",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Vx.black,
                        fontWeight: FontWeight.w600,
                        fontSize: forHeight(16)),
                  ).centered(),
                  decoration: BoxDecoration(
                    color: ColorModel().green,
                    border: Border(
                        left: BorderSide(
                      width: forHeight(2),
                      color: Vx.black,
                    )),
                  ),
                ),
                Visibility(
                  visible: isOn,
                  child: Container(
                    height: forHeight(57),
                    width: width * 18,
                    child: Text(
                      "I/O",
                      style: TextStyle(
                          color: Vx.black,
                          fontWeight: FontWeight.w600,
                          fontSize: forHeight(16)),
                    ).centered(),
                    decoration: BoxDecoration(
                      color: ColorModel().green,
                      border: Border(
                          left: BorderSide(
                        width: forHeight(2),
                        color: Vx.black,
                      )),
                    ),
                  ),
                ),
                Visibility(
                  visible: isOn,
                  child: Container(
                    height: forHeight(57),
                    width: width * 18,
                    child: Text(
                      "CPU",
                      style: TextStyle(
                          color: Vx.black,
                          fontWeight: FontWeight.w600,
                          fontSize: forHeight(16)),
                    ).centered(),
                    decoration: BoxDecoration(
                      color: ColorModel().green,
                      border: Border(
                          left: BorderSide(
                        width: forHeight(2),
                        color: Vx.black,
                      )),
                    ),
                  ),
                ),
              ],
            ),
            ListView.builder(
              itemCount: length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return RRSTableClass(index, isOn);
              },
            ),
            sizedBoxForHeight(30),
            Row(
              mainAxisAlignment: length > 1
                  ? MainAxisAlignment.spaceAround
                  : MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    SJFModel.tableListValue.add(SJFModel(0, 0, 0, 0));
                    setState(() {
                      length++;
                    });
                  },
                  child: Container(
                    height: forHeight(48),
                    width: forHeight(115),
                    child: Text(
                      "Add",
                      style: TextStyle(
                          color: Vx.black,
                          fontWeight: FontWeight.w600,
                          fontSize: forHeight(16)),
                    ).centered(),
                    decoration: BoxDecoration(
                      color: ColorModel().green,
                      borderRadius: BorderRadius.circular(forHeight(4)),
                    ),
                  ),
                ),
                Visibility(
                  visible: length > 1,
                  child: GestureDetector(
                    onTap: () {
                      SJFModel.tableListValue.removeLast();
                      setState(() {
                        length--;
                      });
                    },
                    child: Container(
                      height: forHeight(48),
                      width: forHeight(115),
                      child: Text(
                        "Remove",
                        style: TextStyle(
                            color: Vx.black,
                            fontWeight: FontWeight.w600,
                            fontSize: forHeight(16)),
                      ).centered(),
                      decoration: BoxDecoration(
                        color: ColorModel().green,
                        borderRadius: BorderRadius.circular(forHeight(4)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
