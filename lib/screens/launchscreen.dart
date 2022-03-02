import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:question1/helper/borders.dart';
import 'package:question1/helper/buttons.dart';
import 'package:question1/helper/themedata.dart';
// import 'package:question1/helper/themedata.dart';
import 'package:question1/models/availabledays.dart';
import 'package:question1/models/slots.dart';
import 'package:question1/notifiers/update_notifier.dart';
import 'package:question1/repo/timerrepo.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchState createState() => _LaunchState();
}

class _LaunchState extends State<LaunchScreen> {
  late timerRepo timer;
  List<AvailableDays> availableDays = [];
  late UpdateNotifier _updateNotifier;
  @override
  void initState() {
    _updateNotifier = Provider.of<UpdateNotifier>(context, listen: false);
    timer = timerRepo();
    availableDays = timer.availableDays;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            margin:
                const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
            child: Column(
              children: [
                Consumer<UpdateNotifier>(
                  builder: (context, value, child) {
                    return ListView.builder(
                        itemCount: availableDays.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return sheduleItem(availableDays[index]);
                        });
                  },
                ),
                const SizedBox(height: 20,),
                commonButton(name: "Save", onTap: () {},bg:colorPrimary)
              ],
            ),
          ),
        ),
      ),
    );
  }

  sheduleItem(AvailableDays day) {
    return Container(
          margin: EdgeInsets.only(top: 10),
        child: Row(
      children: [
        InkWell(
          onTap: () {
            day.available = !day.available!;
            _updateNotifier.update();
          },
          child: Image(
            image: const AssetImage("assests/icons/tick.png"),
            height: 24,
            width: 24,
            color: day.available! ? Colors.green : Colors.grey,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          day.day!,
          style: TextStyle(
              color: day.available! ? Colors.black : Colors.grey, fontSize: 14),
        ),
        const SizedBox(
          width: 10,
        ),
        day.available! ?SizedBox(
          height: 22,
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return dayItem(day.slots![index]);
            },
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: day.slots!.length,
          ),
        ):const Text(
          "Un Available",
          style: TextStyle(
              color: Colors.grey, fontSize: 14),
        )
      ],
    ));
  }

  dayItem(Slots slot) {
    bool? available = slot.available;
    return InkWell(
      onTap: () {
        slot.available = !available!;
        _updateNotifier.update();
      },
      child: Container(
        margin: const EdgeInsets.only(left: 5, right: 5),
        padding: const EdgeInsets.only(left: 5,right: 5),
        decoration: getBorder(color: available! ? Colors.black : Colors.grey),
        child: Text(
          slot.title!,
          style: TextStyle(
              color: available ? Colors.black : Colors.grey, fontSize: 11),
        ),
      ),
    );
  }
}
