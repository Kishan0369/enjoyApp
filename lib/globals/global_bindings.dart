import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../controller/enjoy_controller.dart';


class GlobalBinding extends  Bindings{
  @override
  void dependencies() {
     Get.put(EnjoyController());
    // TODO: implement dependencies
  }

}
