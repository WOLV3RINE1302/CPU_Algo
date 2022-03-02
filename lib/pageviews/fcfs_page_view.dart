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

ScrollController sc = ScrollController();
String runningItem = "";
int time = 0;
int runPhase = 0;
Map<String, dynamic> taTime = {};
Map<String, dynamic> waitingTime = {};
List<dynamic> completionTime = [];
bool isNextPageVisible = false;

class Temp {
  static List<double> list = [];
  static List<int> id = [];
  static List<int> time = [];
  static List<Color> colors = [];
}

class _FCFCPageViewState extends State<FCFCPageView> {
  int length = 1;
  PageController pc = PageController();
  @override
  Widget build(BuildContext context) {
    bool isOn = FCFSModel.ioSwitch;
    return PageView(
      controller: pc,
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
                return FCFSTableClass(index, isOn);
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
                    FCFSModel.tableListValue.add(FCFSModel(0, 0, 0, 0, 0));
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
            sizedBoxForHeight(30),
            GestureDetector(
              onTap: () {
                bool isFieldsEmpty = false;
                for (var item in FCFSModel.tableListValue) {
                  if (isOn) {
                    isFieldsEmpty = item.cpuBurstValue != 0 || item.cpu != 0;
                    if (!isFieldsEmpty) {
                      break;
                    }
                  } else {
                    isFieldsEmpty = item.cpuBurstValue != 0;
                    if (!isFieldsEmpty) {
                      break;
                    }
                  }
                }
                if (isFieldsEmpty) {
                  Temp.list.clear();
                  Temp.id.clear();
                  Temp.time.clear();
                  Temp.colors.clear();
                  FCFSModel.tableListValue = FCFSModel.tableListValue
                      .sortedBy((a, b) => a.atValue.compareTo(b.atValue));
                  completionTime = List.generate(
                      FCFSModel.tableListValue.length, (index) => 0);

                  for (var i = 0; i < completionTime.length; i++) {
                    Temp.list.add(0);
                    Temp.id.add(FCFSModel.tableListValue[i].id);
                    Temp.time.add(FCFSModel.tableListValue[i].cpuBurstValue);
                    Temp.colors.add(ColorModel().red);
                  }
                  for (var i = 0; i < FCFSModel.tableListValue.length; i++) {
                    completionTime[i] = 0;
                    if (i != 0) {
                      if (completionTime[i - 1] <
                          FCFSModel.tableListValue[i].atValue) {
                        for (var k = i;
                            k < FCFSModel.tableListValue.length;
                            k++) {
                          completionTime[k] +=
                              FCFSModel.tableListValue[i].atValue -
                                  completionTime[i - 1];
                        }
                      }
                    }
                    for (var j = 0;
                        j < FCFSModel.tableListValue.sublist(0, i + 1).length;
                        j++) {
                      completionTime[i] +=
                          FCFSModel.tableListValue[j].cpuBurstValue;
                    }
                    taTime["P-$i"] =
                        completionTime[i] - FCFSModel.tableListValue[i].atValue;
                    waitingTime["P-$i"] = taTime["P-$i"] -
                        FCFSModel.tableListValue[i].cpuBurstValue;
                    // print(i);
                    // print("com: ${completionTime[i]}");
                    // print("taTime: ${taTime["P-$i"]}");
                    // print("waitingTime: ${waitingTime["P-$i"]}");
                  }
                  setState(() {
                    isNextPageVisible = true;
                  });
                  pc.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear);
                } else {
                  VxToast.show(
                    context,
                    msg: "Please Enter Burst Time",
                    textSize: forHeight(16),
                  );
                }
              },
              child: Container(
                height: forHeight(48),
                width: forHeight(155),
                child: Text(
                  "Calculation",
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
            ).centered(),
          ],
        ),
        Container(
          child: !isNextPageVisible
              ? Text(
                  "No Calculation",
                  style: TextStyle(color: Vx.white, fontSize: forHeight(28)),
                ).centered().pOnly(bottom: forHeight(21))
              : Column(
                  children: [
                    sizedBoxForHeight(40),
                    Container(
                      height: forHeight(280),
                      width: forWidth(310),
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            sizedBoxForWidth(10),
                        itemCount: FCFSModel.tableListValue.length,
                        physics: AlwaysScrollableScrollPhysics(
                            parent: BouncingScrollPhysics()),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          FCFSModel item = FCFSModel.tableListValue[index];
                          int wt = waitingTime["P-${item.id}"].toInt() < 0
                              ? 0
                              : waitingTime["P-${item.id}"].toInt();
                          return Container(
                            height: forHeight(280),
                            width: forHeight(175),
                            decoration: BoxDecoration(
                              color: ColorModel().red,
                              borderRadius: BorderRadius.circular(
                                forHeight(10),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                rowForValueDisplay("P-ID", item.id.toString()),
                                rowForValueDisplay(
                                    "AT", item.atValue.toString()),
                                rowForValueDisplay(
                                    "CB", item.cpuBurstValue.toString()),
                                rowForValueDisplay("TAT",
                                    taTime["P-${item.id}"].toInt().toString()),
                                rowForValueDisplay(
                                  "WT",
                                  wt.toString(),
                                ),
                                rowForValueDisplay("CT",
                                    completionTime[index].toInt().toString()),
                              ],
                            ).pSymmetric(h: forWidth(12), v: forHeight(14)),
                          );
                        },
                      ),
                    ),
                    sizedBoxForHeight(50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                              color: ColorModel().red,
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            runningItem == ""
                                ? "Not Running"
                                : "$runningItem is Running!",
                            style: TextStyle(color: Vx.black, fontSize: 16),
                          ).centered(),
                        ),
                        Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                              color: ColorModel().red,
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            Temp.colors.last == Vx.white
                                ? "Total time: $time"
                                : "Seconds: $time",
                            style: TextStyle(color: Vx.black, fontSize: 16),
                          ).centered(),
                        ),
                      ],
                    ),
                    sizedBoxForHeight(20),
                    ListView.builder(
                      physics: AlwaysScrollableScrollPhysics(
                          parent: BouncingScrollPhysics()),
                      controller: sc,
                      itemCount: Temp.list.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => AnimatedContainer(
                        duration: Duration(milliseconds: 1000),
                        decoration: BoxDecoration(
                            color: Temp.colors[index],
                            border: Border(
                                right: BorderSide(
                                    color: Vx.black,
                                    width: 2,
                                    style: Temp.colors[index] == Vx.white
                                        ? BorderStyle.solid
                                        : BorderStyle.none))),
                        height: 70,
                        width: Temp.list[index],
                        child: Text(
                          Temp.colors[index] == Vx.white
                              ? "P-${Temp.id[index]}"
                              : "",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: forHeight(16)),
                        ).centered(),
                      ),
                    ).h(70).objectCenterLeft(),
                    sizedBoxForHeight(30),
                    ElevatedButton(
                      onPressed: () async {
                        if (runPhase == 0) {
                          setState(() {
                            runPhase = 1;
                          });
                          print(runningItem);
                          for (var i = 0; i < Temp.time.length; i++) {
                            setState(() {
                              runningItem = "P-${Temp.id[i]}";
                            });
                            for (var j = 0; j < Temp.time[i]; j++) {
                              await Future.delayed(Duration(seconds: 1));
                              setState(() {
                                sc.animateTo(sc.position.maxScrollExtent,
                                    duration: Duration(milliseconds: 1000),
                                    curve: Curves.linear);
                                Temp.list[i] += forWidth(60);
                                Future.delayed(Duration(milliseconds: 200), () {
                                  time++;
                                });
                              });
                            }
                            await Future.delayed(Duration(milliseconds: 1000));
                            setState(() {
                              sc.animateTo(sc.position.maxScrollExtent,
                                  duration: Duration(milliseconds: 1000),
                                  curve: Curves.linear);
                              Temp.colors[i] = Vx.white;
                            });
                          }
                          setState(() {
                            runningItem = "";
                            runPhase = 2;
                            sc.animateTo(sc.position.maxScrollExtent,
                                duration: Duration(milliseconds: 800),
                                curve: Curves.linear);
                          });
                        } else if (runPhase == 1) {
                        } else {
                          for (var i = 0; i < Temp.colors.length; i++) {
                            Temp.colors[i] = Color.fromARGB(255, 255, 68, 68);
                            Temp.list[i] = 0;
                          }
                          setState(() {
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
                    )
                  ],
                ),
        )
      ],
    );
  }
}

Row rowForValueDisplay(String type, String val) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        type,
        style: TextStyle(
          color: Vx.black,
          fontSize: forHeight(20),
          fontWeight: FontWeight.w700,
        ),
      ),
      Text(
        val,
        style: TextStyle(
          color: Vx.black,
          fontSize: forHeight(20),
          fontWeight: FontWeight.w700,
        ),
      ),
    ],
  );
}
