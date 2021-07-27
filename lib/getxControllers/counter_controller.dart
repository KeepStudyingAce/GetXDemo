import 'package:get/get.dart';
import 'package:getx_demo/route_config.dart';

/*
  分析

Obx是配合Rx响应式变量使用、GetBuilder是配合update使用：请注意，这完全是俩套定点刷新控件的方案
区别：前者响应式变量变化，Obx自动刷新；后者需要使用update手动调用刷新
响应式变量，因为使用的是StreamBuilder，会消耗一定资源
GetBuilder内部实际上是对StatefulWidget的封装，所以占用资源极小
使用场景

一般来说，对于大多数场景都是可以使用响应式变量的
但是，在一个包含了大量对象的List，都使用响应式变量，将生成大量的StreamBuilder，必将对内存造成较大的压力，该情况下，就要考虑使用简单状态管理了
总的来说：推荐GetBuilder和update配合的写法
GetBuilder内置回收GetxController的功能，能避免一些无法自动回收GetxController的坑爹问题
使用Obx，相关变量定义初始化以及实体更新和常规写法不同，会对初次接触该框架的人，造成很大的困扰
getx插件现已支持一键Wrap Widget生成GetBuilder，可以一定程度上提升你的开发效率

*/
//====================Obx使用:响应式变量====================
class CounterController extends GetxController {
  var count = 0.obs;

  ///自增
  void increase() => ++count;

  ///跳转到build页面
  void toJump() {
    Get.toNamed(RouteConfig.counterBuildOne);
  }
}

//====================GetBuilder和update使用:手动出发更新，类似provider的notifyListeners()====================
class CounterGetController extends GetxController {
  var count = 0;
  void increase() {
    ++count;
    update();
  }
}

//====================路由管理====================
class GetRouteOneController extends GetxController {
  var count = 0;

  ///跳转到跨页面
  void toJumpTwo() {
    //此种路由可以传任意参数和对象到下一个页面
    Get.toNamed(RouteConfig.getJumpTwo, arguments: {'msg': '我是上个页面传递过来的数据'});
  }

  ///跳转到跨页面
  void increase() {
    count = ++count;
    update();
  }
}

class GetRouteTwoController extends GetxController {
  var count = 0;
  String msg = '';
  /*
    GetxController包含比较完整的生命周期回调，可以在onInit()接受传递的数据；
    如果接收的数据需要刷新到界面上，请在onReady回调里面接收数据操作
    onReady是在addPostFrameCallback回调中调用，刷新数据的操作在onReady进行，能保证界面是初始加载完毕后才进行页面刷新操作的
  */
  @override
  void onReady() {
    var map = Get.arguments;
    msg = map['msg'];
    update();

    super.onReady();
  }

  ///跳转到跨页面
  void increase() {
    count = ++count;
    update();
  }
}
