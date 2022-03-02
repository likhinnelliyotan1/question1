import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:question1/helper/borders.dart';
import 'package:question1/helper/buttons.dart';
import 'package:question1/helper/themedata.dart';
// import 'package:question1/helper/themedata.dart';
import 'package:question1/models/availabledays.dart';
import 'package:question1/models/days.dart';
import 'package:question1/models/slots.dart';
import 'package:question1/notifiers/update_notifier.dart';
import 'package:question1/repo/timerrepo.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<LandingScreen> {
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            margin:
            const EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 20),
            child: Column(
              children: [
                const  Text(
                  "Name",
                  style: TextStyle(
                      color: Colors.black, fontSize: 14),
                ),
                const SizedBox(height: 20,),
                commonButton(name: "Continue", onTap: () {
                  saveData();
                },bg:colorPrimary)
              ],
            ),
          ),
        ),
      ),
    );
  }

  late String name;
  saveData()
  {

    //var jsonData=Days().toJson();

  }
}
