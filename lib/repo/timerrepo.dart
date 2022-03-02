import 'package:question1/models/availabledays.dart';
import 'package:question1/models/slots.dart';

class timerRepo {
  timerRepo() {
    create();
  }
  List<AvailableDays> availableDays = [];
  void create() {
    availableDays = [];

    availableDays.add(getDay("SUN"));
    availableDays.add(getDay("MON"));
    availableDays.add(getDay("TUE"));
    availableDays.add(getDay("WED"));
    availableDays.add(getDay("THU"));
    availableDays.add(getDay("FRI"));
    availableDays.add(getDay("SAT"));

  }
  getDay(title)
  {
    Slots morning = Slots(title: "Morning",available: true);
    Slots evening = Slots(title: "Evening");
    Slots afternoon = Slots(title: "After Noon");
    List<Slots> timeSlots = [];
    timeSlots.add(morning);
    timeSlots.add(afternoon);
    timeSlots.add(evening);
    return AvailableDays(slots: timeSlots, day: title);

  }
}
