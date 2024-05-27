import 'package:enjoy/view/Camera_Screen.dart';
import 'package:enjoy/view/Sports/sportsScreen.dart';
import 'package:enjoy/view/Travel/travelScreen.dart';
import 'package:enjoy/view/items_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity/connectivity.dart';
import '../controller/enjoy_controller.dart';
import 'Gift/giftScreen.dart';
import 'bottom_navbar.dart';

class EnjoyHomePage extends StatelessWidget {
  EnjoyController enjoyController = Get.find<EnjoyController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Obx(
                    () => _widgetOptions.elementAt(enjoyController.selectedIndex.value),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(), // Using the extracted BottomNavigationBar

    );
  }


  Future<bool> _checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  List<Widget> _widgetOptions = <Widget>[
    ItemsScreen(),
    GiftScreen(),
    CameraForm(),
    SportsScreen(),
    TravelScreen()
  ];
}
