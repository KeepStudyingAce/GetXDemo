import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/getxControllers/counter_controller.dart';

class GetJumpOnePage extends StatelessWidget {
  GetJumpOnePage({Key key}) : super(key: key);

  /// 使用Get.put()实例化你的类，使其对当下的所有子路由可用。
  final GetRouteOneController logic = Get.put(GetRouteOneController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('跨页面-One')),
      floatingActionButton: FloatingActionButton(
        heroTag: "ssss",
        onPressed: () => logic.toJumpTwo(),
        child: const Icon(Icons.arrow_forward_outlined),
      ),
      body: Center(
        child: GetBuilder<GetRouteOneController>(
          builder: (logic) {
            return Text('跨页面-Two点击了 ${logic.count} 次',
                style: TextStyle(fontSize: 30.0));
          },
        ),
      ),
    );
  }
}
