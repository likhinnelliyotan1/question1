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
                const EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 20),
            child: Column(
              children: [
               const  Text(
                  "Set your Weekly hours",
                  style: TextStyle(
                      color: Colors.black, fontSize: 14),
                ),
                const SizedBox(height: 15,),
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
    return Column(

      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
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
        SizedBox(
          width: 80,
          child: Text(
            day.day!,
            style: TextStyle(
                color: Colors.black, fontSize: 14),
          ),
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
    ),
        const SizedBox(
          height: 10,
        ),
        Divider(height: 1,)
      ],
    );
  }

  dayItem(Slots slot) {
    bool? available = slot.available;
    return InkWell(
      onTap: () {
        slot.available = !available!;
        _updateNotifier.update();
      },
      child: Container(
        margin: const EdgeInsets.only(left: 4, right: 4),
        padding: const EdgeInsets.only(left: 2,right: 2),
        decoration: getBorder(color: available! ? colorPrimary : Colors.grey),
        child: Text(
          slot.title!,
          style: TextStyle(
              color: available ? colorPrimary : Colors.grey, fontSize: 12),
        ),
      ),
    );
  }
  List<AvailableDays> getAvailableDays()
  {
    List<AvailableDays> days=[];
    for(int i=0;i<availableDays.length;i++)
      {
        if(availableDays[i].available!)
          days.add(availableDays[i]);
      }
    return days;
  }
  saveData()
  {
    List<AvailableDays> days=getAvailableDays();
    String txt="";
    Days day=Days(days:availableDays);
    //var jsonData=Days().toJson();

  }
}
