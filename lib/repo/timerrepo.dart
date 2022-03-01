import 'package:question1/models/availabledays.dart';
import 'package:question1/models/slots.dart';

class timerRepo {
  timerRepo() {
    create();
  }
  List<AvailableDays> availableDays = [];
  void create() {
    availableDays = [];

    availableDays.add(getDay("Sunday"));
    availableDays.add(getDay("Monday"));
    availableDays.add(getDay("Tuesday"));
    availableDays.add(getDay("Wednesday"));
    availableDays.add(getDay("Thursday"));
    availableDays.add(getDay("Friday"));
    availableDays.add(getDay("Saturday"));

  }
  getDay(title)
  {
    Slots morning = Slots(title: "Morning");
    Slots evening = Slots(title: "Evening");
    Slots afternoon = Slots(title: "After Noon");
    List<Slots> timeSlots = [];
    timeSlots.add(morning);
    timeSlots.add(afternoon);
    timeSlots.add(evening);
    return AvailableDays(slots: timeSlots, day: title);

  }
}
