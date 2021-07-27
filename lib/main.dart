import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getx_demo/pages/counter_get_page.dart';
import 'package:getx_demo/pages/get_jump_one_page.dart';
import 'package:getx_demo/route_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      getPages: RouteConfig.getPages,
      home: CupertinoTabScaffold(
        resizeToAvoidBottomInset: false,
        tabBar: CupertinoTabBar(
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              label: "计数器",
              icon: Icon(Icons.calculate),
              activeIcon: Icon(Icons.calculate_outlined),
            ),
            BottomNavigationBarItem(
              label: "路由",
              icon: Icon(Icons.router),
              activeIcon: Icon(Icons.router_outlined),
            )
          ],
        ),
        tabBuilder: (context, index) {
          Widget item;
          switch (index) {
            case 0:
              item = CounterGetPage();
              break;
            case 1:
              item = GetJumpOnePage();
              break;
            default:
          }
          return item;
        },
      ),
    );
  }
}
