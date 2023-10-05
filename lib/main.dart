import 'package:bootcamp_flutter/pages/brasilFields/BrasilFieldsPage.dart';
import 'package:bootcamp_flutter/pages/home/homePage.dart';
import 'package:bootcamp_flutter/pages/autoSizeTextPage/autoSizeTextPage.dart';
import 'package:bootcamp_flutter/pages/percentPage/PercentualPage.dart';
import 'package:bootcamp_flutter/pages/splashScreen/SplashScreen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

void main() async {
   await EasyLocalization.ensureInitialized();
  
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('pt', 'BR')],
      path: 'assets/translations', 
      fallbackLocale: const Locale('pt', 'BR'),
      child: const MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int pageIndex = 0;
  late TabController controller;

  @override
  void initState() {
    controller = TabController(initialIndex: 0, length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: TabBarView(
        controller: controller,
        children: const [HomePage(), PercentualPage(), AutoSizeTextPage(),BrasilFieldsPage()],
      ),
      bottomNavigationBar: ConvexAppBar.badge(const {
        0: '99+',
        1: Icons.assistant_photo,
        2: Colors.redAccent
      },
      onTap: (index) {
        setState(() {
            pageIndex = index;
            controller.index = pageIndex;
          });
      },
      
      items: const [
        TabItem(
            title: "Percentual",
            icon: FaIcon(
              FontAwesomeIcons.percent,
            )),
        TabItem(
            title: "Auto Size Text",
            icon: FaIcon(
              FontAwesomeIcons.paperclip,
            ))
      ]),
    );
  }
}
