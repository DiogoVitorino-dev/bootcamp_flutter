import 'package:bootcamp_flutter/service/generateRandom.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var randomNum = 0;
  var clicks = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Home",
        //style: GoogleFonts.openSans(),
      )),

      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: Container(
                color: Colors.indigo,              
                child: Text(randomNum.toString())
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.deepOrange,
                child: Text(clicks.toString())
              ),
            ),

            Expanded(
              child: Container(
                color: Colors.grey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.cyan,
                        child: const Text("horizontal")
                      ),
                    ),
                    Expanded(                  
                      child: Container(
                        color: Colors.teal,
                        child: const Text("10")
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.orange,
                        child: const Text("dev")
                      ),
                    ),
                ],),
              ),
            )
        ], ),
      ) ,

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            randomNum = GenerateRandom.generate(100);
            clicks++;
          });
        },
      ),
    );
  }
}
