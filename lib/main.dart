import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:os_project/homepage.dart';
import 'package:velocity_x/velocity_x.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
