import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:os_project/main.dart';
import 'package:velocity_x/velocity_x.dart';

import 'help_in_responsive_widgets.dart';

class AlgoPage extends StatefulWidget {
  int mainIndex;
  AlgoPage(this.mainIndex);
  @override
  State<AlgoPage> createState() => _AlgoPageState();
}

class _AlgoPageState extends State<AlgoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.black,
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: colors[widget.mainIndex]),
      ),
      body: CustomScrollView(
        physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        slivers: <Widget>[
          SliverAppBar(
            stretch: true,
            expandedHeight: forHeight(180),
            backgroundColor: colors[widget.mainIndex],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                height: forHeight(100),
                width: forWidth(100),
                child: Image.asset(
                        "assets/icons/${iconNames[widget.mainIndex]}.png")
                    .pSymmetric(v: forHeight(13)),
              ).pOnly(bottom: forHeight(40)),
              stretchModes: <StretchMode>[StretchMode.zoomBackground],
              titlePadding:
                  EdgeInsets.fromLTRB(forWidth(10), 0, 0, forHeight(6)),
              title: Text(
                fullNames[widget.mainIndex],
                style: TextStyle(color: Vx.black, fontSize: forHeight(16)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
