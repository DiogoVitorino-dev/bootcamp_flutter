import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PercentualPage extends StatefulWidget {
  const PercentualPage({super.key});

  @override
  State<PercentualPage> createState() => _PercentualPageState();
}

class _PercentualPageState extends State<PercentualPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Percent Indicator"),
      ),
      body: Row(
        children: [
          CircularPercentIndicator(
            radius: 130.0,
            animation: true,
            animationDuration: 1200,
            lineWidth: 15.0,
            percent: 0.4,
            center: const Text(
              "40 hours",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            circularStrokeCap: CircularStrokeCap.butt,
            backgroundColor: Colors.yellow,
            progressColor: Colors.red,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: LinearPercentIndicator(
              width: MediaQuery.of(context).size.width - 50,
              animation: true,
              lineHeight: 20.0,
              animationDuration: 2000,
              percent: 0.9,
              center: const Text("90.0%"),
              progressColor: Colors.greenAccent,
            ),
          ),
        ],
      ),
    );
  }
}
