import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';

class EnjoyController extends GetxController {
  var selectedIndex = 0.obs;
  List<Color?> colors = [Colors.red,Colors.indigo,Colors.purple,Color(0xFF4E342E),Color(0xFF191970)];

  void changePage(int index) {
    selectedIndex.value = index;
  }
}
