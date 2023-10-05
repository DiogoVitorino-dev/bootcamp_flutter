import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("APP_TITLE").tr(),
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.deepOrange),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text("IntL"),
        onPressed: () {
          var f = NumberFormat('#,###.0#', 'pt_BR');
          var fUs = NumberFormat('#,###.0#', 'en_US');
          print(f.format(1234.345));
          print(fUs.format(1234.345));

          var date = DateTime(2023, 05, 02);
          print(DateFormat('EEEEE', 'en_US').format(date));
          print(DateFormat('EEEEE', 'pt_BR').format(date));

          if (context.locale.toString() == "en_US") {
            context.setLocale(Locale('pt', 'BR'));
          } else {
            context.setLocale(Locale('en', 'US'));
          }
        },
      ),
    );
  }
}
