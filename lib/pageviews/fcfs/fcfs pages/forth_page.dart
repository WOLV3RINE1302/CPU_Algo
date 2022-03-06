import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../model/color_model.dart';
import '../../../widget/help_in_responsive_widgets.dart';
import '../fcfs_page_view.dart';

class FCFSPageViewForthPage extends StatefulWidget {
  FCFSPageViewForthPage({Key? key}) : super(key: key);

  @override
  State<FCFSPageViewForthPage> createState() => _FCFSPageViewForthPageState();
}

class _FCFSPageViewForthPageState extends State<FCFSPageViewForthPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: !isNextPageVisible
          ? Text(
              "No Graph",
              style: TextStyle(color: Vx.white, fontSize: forHeight(28)),
            ).centered().pOnly(bottom: forHeight(21))
          : ListView(
              physics: AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              children: [
                sizedBoxForHeight(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: forHeight(40),
                      width: forHeight(150),
                      decoration: BoxDecoration(
                          color: ColorModel().red,
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        runningItem == ""
                            ? "Not Running"
                            : runningItem != "CPU Idle"
                                ? "$runningItem is Running!"
                                : "CPU is Idle",
                        style: TextStyle(color: Vx.black, fontSize: 16),
                      ).centered(),
                    ),
                    Container(
                      height: forHeight(40),
                      width: forHeight(150),
                      decoration: BoxDecoration(
                          color: ColorModel().red,
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        "Seconds: $time",
                        style:
                            TextStyle(color: Vx.black, fontSize: forHeight(16)),
                      ).centered(),
                    ),
                  ],
                ),
                sizedBoxForHeight(40),
                Container(
                  constraints: BoxConstraints(maxHeight: forHeight(370)),
                  child: ListView.builder(
                    reverse: true,
                    physics: AlwaysScrollableScrollPhysics(
                        parent: BouncingScrollPhysics()),
                    itemCount: showInGraphList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return AnimatedContainer(
                        duration: Duration(milliseconds: 1000),
                        height: forHeight(70),
                        child: Text(showInGraphList[index]["color"] ==
                                    ColorModel().red
                                ? ""
                                : showInGraphList[index]["id"])
                            .centered(),
                        width: double.parse(
                            showInGraphList[index]["value"].toString()),
                        color: showInGraphList[index]["color"],
                      ).objectCenterLeft();
                    },
                  ),
                ),
                sizedBoxForHeight(50),
                ElevatedButton(
                  onPressed: () async {
                    if (runPhase == 0) {
                      setState(() {
                        runPhase = 1;
                      });
                      int j = 0;
                      for (var i = 0; i < completionTime.length; i++) {
                        if (i == 0) {
                          int value = showInGraphList[0]["value"] +=
                              forHeight(40).round();
                          runningItem = completionTime[0];
                          showInGraphList[0] = {
                            "id": completionTime[0],
                            "value": value,
                            "color": ColorModel().red
                          };
                          runPhase = 1;
                          setState(() {});
                          await Future.delayed(Duration(seconds: 1));
                          time++;
                          setState(() {});
                        } else {
                          if (completionTime[i] == completionTime[i - 1]) {
                            runningItem = completionTime[i];
                            int value = showInGraphList[j]["value"] +=
                                forHeight(40).round();
                            showInGraphList[j] = {
                              "id": completionTime[i],
                              "value": value,
                              "color": ColorModel().red
                            };
                            await Future.delayed(Duration(seconds: 1));
                            time++;
                            setState(() {});
                          } else {
                            showInGraphList[j] = {
                              "id": completionTime[i - 1],
                              "value": showInGraphList[j]["value"],
                              "color": Vx.white
                            };
                            j++;
                            runningItem = completionTime[i];
                            int value = showInGraphList[j]["value"] +=
                                forHeight(40).round();
                            showInGraphList[j] = {
                              "id": completionTime[i],
                              "value": value,
                              "color": ColorModel().red
                            };
                            await Future.delayed(Duration(seconds: 1));
                            time++;
                            setState(() {});
                          }
                        }
                      }
                      runningItem = "";
                      showInGraphList[j] = {
                        "id": completionTime.last,
                        "value": showInGraphList[j]["value"],
                        "color": Vx.white
                      };
                      setState(() {
                        runPhase = 2;
                      });
                    } else if (runPhase == 1) {
                    } else {
                      for (var i = 0; i < showInGraphList.length; i++) {
                        showInGraphList[i] = {
                          "id": "",
                          "value": 0,
                          "color": ColorModel().red
                        };
                      }
                      setState(() {
                        runningItem = "";
                        time = 0;
                        runPhase = 0;
                      });
                    }
                  },
                  style: TextButton.styleFrom(
                      fixedSize: Size(forHeight(120), forHeight(50)),
                      backgroundColor:
                          runPhase == 1 ? Vx.gray400 : ColorModel().red),
                  child: Text(
                    runPhase == 0 || runPhase == 1 ? "Run" : "Reset",
                    style: TextStyle(
                        color: runPhase == 1 ? Vx.white : Vx.black,
                        fontSize: forHeight(20)),
                  ),
                ).objectBottomCenter()
              ],
            ),
    );
  }
}
