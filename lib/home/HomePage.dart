import 'package:bootcamp_flutter/baterryPlus/BatteryPlusPage.dart';
import 'package:bootcamp_flutter/functionalities/FunctionalitiesPage.dart';
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
          children: const [FunctionalitiesPage() ,BatteryPlusPage()],
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (value) => controller.jumpToPage(value),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.list)),BottomNavigationBarItem(icon: Icon(Icons.battery_charging_full)),
            ]),        
      ),
    );
  }
}
