import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../main.dart';
import '../model/color_model.dart';
import '../model/fcfs_model.dart';
import '../pages/fcfs_table_class.dart';
import '../widget/help_in_responsive_widgets.dart';

class FCFCPageView extends StatefulWidget {
  FCFCPageView({Key? key}) : super(key: key);

  @override
  State<FCFCPageView> createState() => _FCFCPageViewState();
}

class _FCFCPageViewState extends State<FCFCPageView> {
  int length = 1;
  @override
  Widget build(BuildContext context) {
    bool isOn = FCFSModel.ioSwitch;
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
                  value: FCFSModel.ioSwitch,
                  activeColor: ColorModel().red,
                  inactiveTrackColor: Color.fromARGB(255, 75, 75, 75),
                  onChanged: (val) {
                    setState(() {
                      FCFSModel.ioSwitch = val;
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
                    color: ColorModel().red,
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
                  color: ColorModel().red,
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
                    color: ColorModel().red,
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
                      color: ColorModel().red,
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
                      color: ColorModel().red,
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
                return FCFSTableClass(index,isOn);
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
                    FCFSModel.tableListValue.add(FCFSModel(0, 0, 0, 0));
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
                      color: ColorModel().red,
                      borderRadius: BorderRadius.circular(forHeight(4)),
                    ),
                  ),
                ),
                Visibility(
                  visible: length > 1,
                  child: GestureDetector(
                    onTap: () {
                      FCFSModel.tableListValue.removeLast();
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
                        color: ColorModel().red,
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
