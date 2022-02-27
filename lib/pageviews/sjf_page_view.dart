import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../main.dart';
import '../model/color_model.dart';
import '../model/SJF_model.dart';
import '../pages/sjf_table_class.dart';
import '../widget/help_in_responsive_widgets.dart';

class SJFPageView extends StatefulWidget {
  SJFPageView({Key? key}) : super(key: key);

  @override
  State<SJFPageView> createState() => _SJFPageViewState();
}

class _SJFPageViewState extends State<SJFPageView> {
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
              "● Shortest job first (SJF) is also known as shortest job next.\n\n"
              "● Shortest Job First is a non-pre-emptive algorithm.\n\n"
              "● It selects the waiting process with the smallest execution time to execute next.",
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
                  activeColor: ColorModel().blue,
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
                    color: ColorModel().blue,
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
                  color: ColorModel().blue,
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
                    color: ColorModel().blue,
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
                      color: ColorModel().blue,
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
                      color: ColorModel().blue,
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
                return SJFTableClass(index, isOn);
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
                      color: ColorModel().blue,
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
                        color: ColorModel().blue,
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
