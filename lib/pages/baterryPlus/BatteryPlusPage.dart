import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart';
import 'package:percent_indicator/percent_indicator.dart';

class BatteryPlusPage extends StatefulWidget {
  const BatteryPlusPage({super.key});

  @override
  State<BatteryPlusPage> createState() => _BatteryPlusPageState();
}

class _BatteryPlusPageState extends State<BatteryPlusPage> {
  var battery = Battery();
  var statusBattery = "";
  var percentBattery = 0;

  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    percentBattery = await battery.batteryLevel;

    battery.onBatteryStateChanged.listen((BatteryState state) {
      setState(() {
        statusBattery = state.name;
      });
    });    

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Status Battery: $statusBattery%"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: CircularPercentIndicator(
          radius: 120.0,
          lineWidth: 13.0,
          animation: true,
          percent: percentBattery / 100,
          center: Text(
            "$percentBattery%",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          footer: const Text(
            "Battery percent",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
          ),
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: Colors.purple,
        ),
      ),
    ));
  }
}
