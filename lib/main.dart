import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getx_demo/app_localizations.dart';
import 'package:getx_demo/pages/counter_get_page.dart';
import 'package:getx_demo/pages/get_jump_one_page.dart';
import 'package:getx_demo/route_config.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: AppLocalizations(), // 你的翻译
      locale: Locale('en', 'US'), // 将会按照此处指定的语言翻译
      fallbackLocale: Locale('zh', 'CN'), // 添加一个回调语言选项，以备上面指定的语言翻译不存在
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
              label: "tab_count".tr,
              icon: Icon(Icons.calculate),
              activeIcon: Icon(Icons.calculate_outlined),
            ),
            BottomNavigationBarItem(
              label: "tab_route".tr,
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
