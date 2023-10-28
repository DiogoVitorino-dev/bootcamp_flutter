import 'package:bootcamp_flutter/pages/baterryPlus/BatteryPlusPage.dart';
import 'package:bootcamp_flutter/pages/functionalities/FunctionalitiesPage.dart';
import 'package:bootcamp_flutter/pages/photo/PhotoPage.dart';
import 'package:bootcamp_flutter/pages/qrCode/QrCodePage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Home")),
        body: PageView(
          controller: controller,
          children: const [
            FunctionalitiesPage(),
            BatteryPlusPage(),
            QrCodePage(),
            PhotoPage()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (value) => controller.jumpToPage(value),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.list)),
              BottomNavigationBarItem(icon: Icon(Icons.battery_charging_full)),
              BottomNavigationBarItem(icon: Icon(Icons.qr_code)),
              BottomNavigationBarItem(icon: Icon(Icons.photo_camera)),
            ]),
      ),
    );
  }
}
