import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../../model/color_model.dart';
import '../../../model/fcfs_model.dart';
import '../../../pages/fcfs_table_class.dart';
import '../../../widget/help_in_responsive_widgets.dart';
import '../fcfs_page_view.dart';

class FCFSPageViewSecondPage extends StatefulWidget {
  bool isOn;
  PageController pc;
  FCFSPageViewSecondPage(this.isOn, this.pc);

  @override
  State<FCFSPageViewSecondPage> createState() => _FCFSPageViewSecondPageState();
}

class _FCFSPageViewSecondPageState extends State<FCFSPageViewSecondPage> {
  int length = 1;
  @override
  Widget build(BuildContext context) {
    bool isOn = widget.isOn;
    return ListView(
      physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
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
                  SetheStateMutation();
                });
              },
            ).objectBottomLeft(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: ColorModel().red,
                duration: Duration(milliseconds: 1600),
                content: Text(
                  "Process-ID",
                  style: TextStyle(color: Vx.black, fontSize: forHeight(18)),
                ),
              )),
              child: Container(
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
            ),
            GestureDetector(
              onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: ColorModel().red,
                duration: Duration(milliseconds: 1600),
                content: Text(
                  "Arrival Time",
                  style: TextStyle(color: Vx.black, fontSize: forHeight(18)),
                ),
              )),
              child: Container(
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
            ),
            GestureDetector(
              onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: ColorModel().red,
                duration: Duration(milliseconds: 1600),
                content: Text(
                  "CPU Burst Time",
                  style: TextStyle(color: Vx.black, fontSize: forHeight(18)),
                ),
              )),
              child: Container(
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
            ),
            Visibility(
              visible: isOn,
              child: GestureDetector(
                onTap: () =>
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: ColorModel().red,
                  duration: Duration(milliseconds: 1600),
                  content: Text(
                    "Input/Output Time",
                    style: TextStyle(color: Vx.black, fontSize: forHeight(18)),
                  ),
                )),
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
            ),
            Visibility(
              visible: isOn,
              child: GestureDetector(
                onTap: () =>
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: ColorModel().red,
                  duration: Duration(milliseconds: 1600),
                  content: Text(
                    "CPU Time",
                    style: TextStyle(color: Vx.black, fontSize: forHeight(18)),
                  ),
                )),
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
                FCFSModel.tableListValue
                    .add(FCFSModel(0, 0, 0, 0, 0, 0, 0, false));
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
              completionTime.clear();
              showInGraphList = [
                {"id": "", "value": 0, "color": ColorModel().red}
              ];
              for (var i = 0; i < FCFSModel.tableListValue.length; i++) {
                FCFSModel item = FCFSModel.tableListValue[i];
                FCFSModel.tableListValue[i] = FCFSModel(
                    item.id,
                    item.oldAtValue,
                    item.oldAtValue,
                    item.oldcpuBurstValue,
                    item.oldcpuBurstValue,
                    item.ioTime,
                    item.cpu,
                    false);
              }
              FCFSModel.tableListValue = FCFSModel.tableListValue
                  .sortedBy((a, b) => a.atValue.compareTo(b.atValue));
              if (FCFSModel.tableListValue[0].atValue > 0) {
                for (var i = 0; i < FCFSModel.tableListValue[0].atValue; i++) {
                  completionTime.add("CPU Idle");
                }
              }
              if (isOn) {
                for (var i = 0; i < FCFSModel.tableListValue.length * 2;) {
                  FCFSModel item = FCFSModel.tableListValue[0];
                  completionTime.addAll(List.generate(
                      item.cpuBurstValue, (index) => "P-${item.id}"));
                  num at = item.isFinish
                      ? 99999
                      : item.ioTime + completionTime.length;
                  if (item.isFinish) {
                    completionTimeMap["P-${item.id}"] = completionTime.length;
                    turnAroundTime["P-${item.id}"] =
                        completionTime.length - item.oldAtValue;
                    waitingTime["P-${item.id}"] =
                        turnAroundTime["P-${item.id}"] -
                            (item.oldcpuBurstValue + item.cpu);
                  }
                  item = FCFSModel(
                      item.id,
                      at.round(),
                      item.oldAtValue,
                      item.cpu,
                      item.oldcpuBurstValue,
                      item.ioTime,
                      item.cpu,
                      true);
                  FCFSModel.tableListValue[0] = item;
                  if (FCFSModel.tableListValue[1].atValue >
                          completionTime.length &&
                      FCFSModel.tableListValue[1].isFinish &&
                      i != FCFSModel.tableListValue.length * 2 - 1) {
                    completionTime.addAll(List.generate(
                        FCFSModel.tableListValue[1].atValue -
                            completionTime.length,
                        (index) => "CPU Idle"));
                  }
                  FCFSModel.tableListValue = FCFSModel.tableListValue
                      .sortedBy((a, b) => a.atValue.compareTo(b.atValue));
                  i++;
                }
              } else {
                for (var i = 0; i < FCFSModel.tableListValue.length; i++) {
                  FCFSModel item = FCFSModel.tableListValue[i];
                  if (i == 0) {
                    completionTime.addAll(List.generate(
                        item.cpuBurstValue, (index) => "P-${item.id}"));
                    completionTimeMap["P-${item.id}"] = completionTime.length;
                    turnAroundTime["P-${item.id}"] =
                        (completionTime.length - item.atValue);
                    waitingTime["P-${item.id}"] =
                        (turnAroundTime["P-${item.id}"] - item.cpuBurstValue);
                  } else {
                    if (item.atValue > completionTime.length) {
                      completionTime.addAll(List.generate(
                          item.atValue - completionTime.length,
                          (index) => "CPU Idle"));
                    }
                    completionTime.addAll(List.generate(
                        item.cpuBurstValue, (index) => "P-${item.id}"));
                    completionTimeMap["P-${item.id}"] = completionTime.length;
                    turnAroundTime["P-${item.id}"] =
                        (completionTime.length - item.atValue);
                    waitingTime["P-${item.id}"] =
                        (turnAroundTime["P-${item.id}"] - item.cpuBurstValue);
                  }
                }
              }
              for (var i = 0; i < completionTime.length; i++) {
                if (i == 0 || completionTime[i] != completionTime[i - 1]) {
                  showInGraphList
                      .add({"id": "", "value": 0, "color": ColorModel().red});
                }
              }
              FCFSModel.tableListValue = FCFSModel.tableListValue
                  .sortedBy((a, b) => a.id.compareTo(b.id));
              setState(() {
                isNextPageVisible = true;
              });
              widget.pc.nextPage(
                  duration: Duration(milliseconds: 300), curve: Curves.linear);
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
    );
  }
}
