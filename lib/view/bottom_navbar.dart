// bottom_navigation_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controller/enjoy_controller.dart';

class BottomNavBar extends StatelessWidget {
  final EnjoyController enjoyController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/Vector-3.svg',
              color: enjoyController.colors[enjoyController.selectedIndex.value],
              width: 30,
              height: 30,
            ),
            label: 'Items',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/Vector-2.svg',
              color: enjoyController.colors[enjoyController.selectedIndex.value],
              width: 30,
              height: 30,
            ),
            label: 'Gift',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/Group.svg',
              color: enjoyController.colors[enjoyController.selectedIndex.value],
              width: 30,
              height: 30,
            ),
            label: 'Camera',
          ),

          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/Vector-1.svg',
              color: enjoyController.colors[enjoyController.selectedIndex.value],
              width: 30,
              height: 30,
            ),
            label: 'Sports',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/Vector.svg',
              color: enjoyController.colors[enjoyController.selectedIndex.value],
              width: 30,
              height: 30,
            ),
            label: 'Travel',
          ),
        ],
        currentIndex: enjoyController.selectedIndex.value,
        selectedItemColor: enjoyController.colors[enjoyController.selectedIndex.value],
        unselectedItemColor: Colors.grey,
        onTap: (index) => enjoyController.changePage(index),
      ),
    );
  }
}
