import 'package:bootcamp_flutter/pages/assets.dart';
import 'package:bootcamp_flutter/pages/list_view_h.dart';
import 'package:bootcamp_flutter/pages/list_view_v.dart';
import 'package:bootcamp_flutter/shared/widgets/appDrawer.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        drawer: const AppDrawer(),
        body: Expanded(
          child: PageView(
              scrollDirection: Axis.vertical,
              controller: controller,
              children: const [
                AssetsPage(),
								ListViewH(),
								ListViewV(),

              ]),
        ),
      ),
    );
  }
}
