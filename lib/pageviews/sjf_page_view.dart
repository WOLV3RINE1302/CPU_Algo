import 'package:flutter/material.dart';
import 'package:os_project/pageviews/sjf/sjf%20pages/third_page.dart';
import 'package:velocity_x/velocity_x.dart';
import '../main.dart';
import '../model/color_model.dart';
import '../model/SJF_model.dart';
import '../pages/sjf_table_class.dart';
import '../widget/help_in_responsive_widgets.dart';
import 'SJF/SJF pages/forth_page.dart';
import 'SJF/SJF pages/second_page.dart';
import 'SJF/sjf pages/first_page.dart';
import 'sjf/sjf_page_view.dart';

class SJFPageView extends StatefulWidget {
  SJFPageView({Key? key}) : super(key: key);

  @override
  State<SJFPageView> createState() => _SJFPageViewState();
}

class _SJFPageViewState extends State<SJFPageView> {
  @override
  void initState() {
    super.initState();
    setState(() {
      time = 0;
      runPhase = 0;
      isNextPageVisible = false;
      SJFModel.tableListValue = [SJFModel(0, 0, 0, 0, 0, 0, 0, false)];
      showInGraphList = [
        {"id": "", "value": 0, "color": ColorModel().red}
      ];
    });
  }

  PageController pc = PageController();
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [SetheStateMutation]);
    bool isOn = SJFModel.ioSwitch;
    return PageView(
      controller: pc,
      physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      children: [
        SJFPageViewFirstPage(1),
        SJFPageViewSecondPage(isOn, pc, 2),
        SJFPageViewThirdPage(3),
        SJFPageViewForthPage(4)
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
