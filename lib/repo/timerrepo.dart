import 'package:question1/models/availabledays.dart';
import 'package:question1/models/slots.dart';

class timerRepo {
  timerRepo() {
    create();
  }
  List<AvailableDays> availableDays = [];
  void create() {
    availableDays = [];

    availableDays.add(getDay("SUN",true));
    availableDays.add(getDay("MON",false));
    availableDays.add(getDay("TUE",false));
    availableDays.add(getDay("WED",true));
    availableDays.add(getDay("THU",true));
    availableDays.add(getDay("FRI",false));
    availableDays.add(getDay("SAT",false));

  }
  getDay(title,bool available)
  {
    Slots morning = Slots(title: "Morning");
    Slots evening = Slots(title: "Evening");
    Slots afternoon = Slots(title: "After Noon");
    List<Slots> timeSlots = [];
    timeSlots.add(morning);
    timeSlots.add(afternoon);
    timeSlots.add(evening);
    return AvailableDays(slots: timeSlots, day: title,available: available);

  }
}
