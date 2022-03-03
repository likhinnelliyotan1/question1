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
  String name;
  LaunchScreen({required this.name});

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
                InkWell(
                  onTap: (){
                    saveData();
                  },
                  child: commonButton(name: "Save",bg:colorPrimary),
                )

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
  List<String> getAvailableDays()
  {
    List<String> days=[];
    for(int i=0;i<availableDays.length;i++)
      {
        if(availableDays[i].available!)
          {
            for(int j=0;j<availableDays[i].slots!.length;j++)
              {
                if(availableDays[i].slots![j].available!)
                  {
                    days.add(availableDays[i].day!+" "+availableDays[i].slots![j].title!);
                  }
              }
          }
      }
    return days;
  }
  saveData()
  {
    List<String> days=getAvailableDays();

    String txt="Hi "+widget.name+" Available on";
    for(int i=0;i<days.length;i++)
      {
        if(i==days.length-1&&days.length!=1)
          txt=txt+"and "+days[i];
        else if (i==0)
            txt=txt+days[i];
        else
          txt=txt+", "+days[i];
      }
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (BuildContext context) => displayData(txt)));
  }
  displayData(String text)
  {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.width,
        width: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: Colors.black, fontSize: 22),
          ),
        ),
      ),
    );
  }
}
