import 'package:flutter/material.dart';
import 'package:os_project/color_model.dart';
import 'package:os_project/help_in_responsive_widgets.dart';
import 'package:os_project/main.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      slivers: <Widget>[
        SliverAppBar(
          stretch: true,
          expandedHeight: forHeight(180),
          backgroundColor: Vx.white,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              height: forHeight(100),
              width: forWidth(100),
              child: Image.asset("assets/icons/app_icon.png")
                  .pSymmetric(v: forHeight(13)),
            ).pOnly(bottom: forHeight(40)),
            stretchModes: <StretchMode>[StretchMode.zoomBackground],
            titlePadding: EdgeInsets.fromLTRB(forWidth(10), 0, 0, forHeight(6)),
            title: Text(
              "CPU Scheluding Algorithms",
              style: TextStyle(color: Vx.black, fontSize: forHeight(16)),
            ),
          ),
        ),
        SliverPadding(
          padding:
              EdgeInsets.fromLTRB(forWidth(10), forHeight(20), forWidth(10), 0),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: forHeight(10),
                crossAxisSpacing: forWidth(10)),
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                return Container(
                  decoration: BoxDecoration(
                      color: ColorModel().blue,
                      borderRadius: BorderRadius.circular(forHeight(10))),
                );
              },
              childCount: 6,
            ),
          ),
        ),
      ],
    );
  }
}
