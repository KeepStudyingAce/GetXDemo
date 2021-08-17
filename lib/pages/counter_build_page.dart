import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/getxControllers/counter_controller.dart';

class CounterBuildPage extends StatelessWidget {
  CounterBuildPage({Key key}) : super(key: key);
  final CounterGetController logic = Get.put(CounterGetController());

  /*
GetBuilder这个方法
init：虽然上述代码没用到，但是，这个参数是存在在GetBuilder中的，因为在加载变量的时候就使用Get.put()生成了CounterEasyGetLogic对象，GetBuilder会自动查找该对象，所以，就可以不使用init参数
builder：方法参数，拥有一个入参，类型便是GetBuilder所传入泛型的类型
initState，dispose等：GetBuilder拥有StatefulWidget所有周期回调，可以在相应回调内做一些操作
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX(GetBuilder)计数器'),
      ),
      body: Center(
        child: GetBuilder<CounterGetController>(
          builder: (logicGet) => Text(
            '点击了 ${logicGet.count} 次',
            style: TextStyle(fontSize: 30.0),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "000000",
        onPressed: () => logic.increase(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
