import 'package:bootcamp_flutter/pages/consultaCepPage.dart';
import 'package:bootcamp_flutter/pages/postsPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  PageController pageController = PageController();

  void onTabBottomNav(int index) {
    setState(() {
      selectedIndex = index;
      pageController.jumpToPage(index);
    });
  }

  String getAppBarTitle() {
    switch (selectedIndex) {
      case 0:
        return "Consulta Cep";

      case 1:
        return "Posts";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text(getAppBarTitle()),),
      body: SafeArea(
        child: PageView(
            controller: pageController,
            children: const [ConsultaCepPage(), PostsPage()]),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (value) => onTabBottomNav(value),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.search), label: "Consultar CEP"),
            BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: "Posts")
          ]),
    );
  }
}
