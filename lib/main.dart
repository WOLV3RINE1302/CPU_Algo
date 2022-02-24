import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:os_project/about_page_view.dart';
import 'package:os_project/color_model.dart';
import 'package:os_project/fcfs_page_view.dart';
import 'package:os_project/homepage.dart';
import 'package:os_project/pbs_page_view.dart';
import 'package:os_project/rrs_page_view.dart';
import 'package:os_project/sjf_page_view.dart';
import 'package:os_project/strf_page_view.dart';
import 'package:velocity_x/velocity_x.dart';

void main() async {
  final wfb = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: wfb);
  runApp(VxState(store: MyStore(), child: MaterialApp(home: MyApp())));
}

class MyStore extends VxStore {
  bool changeView = true;
}

class ChangeViewMutation extends VxMutation<MyStore> {
  @override
  perform() {
    store.changeView = !store.changeView;
  }
}

MyStore store = VxState.store;
double height = 0;
double width = 0;
List<Color> colors = [
  ColorModel().red,
  ColorModel().blue,
  ColorModel().green,
  ColorModel().yellow,
  ColorModel().orange,
  Vx.white,
];
List<PageView> pagesViews = [
  pageViewForFCFS(),
  pageViewForSJF(),
  pageViewForRRS(),
  pageViewForSRTF(),
  pageViewForPBS(),
  pageViewForAboutUs(),
];

/* 
First Come First Serve(FCFS)
Shortest Job First(SJF) 
Round-Robin Scheduling (RRS)
Shortest Remaining Time First(SRTF)
Priority Based Scheduling(PBS)*/

List<String> fullNames = [
  "First Come First Serve",
  "Shortest Job First",
  "Round Robin Scheduling",
  "Shortest Remaining Time First",
  "Priority Based Scheduling",
  "About Project"
];
List<String> shortNames = ["FCFS", "SJF", "RRS", "SRTF", "PBS", "About"];
List<String> iconNames = ["fcfs", "sjf", "rr", "srtf", "pbs", "about"];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height / 100;
    width = MediaQuery.of(context).size.width / 100;
    VxState.watch(context, on: [ChangeViewMutation]);
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Vx.black,
        appBar: AppBar(
          toolbarHeight: 0,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: Vx.white),
        ),
        body: HomePage(),
      ),
    );
  }
}
