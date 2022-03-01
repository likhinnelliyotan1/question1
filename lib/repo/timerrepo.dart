import 'package:question1/models/availabledays.dart';
import 'package:question1/models/slots.dart';

class timerRepo {
  timerRepo() {
    create();
  }
  List<AvailableDays> availableDays = [];
  void create() {
    availableDays = [];
    Slots morning = Slots(title: "Morning");
    Slots evening = Slots(title: "Evening");
    Slots afternoon = Slots(title: "After Noon");
    List<Slots> timeSlots = [];
    timeSlots.add(morning);
    timeSlots.add(afternoon);
    timeSlots.add(evening);
    AvailableDays day1 = AvailableDays(slots: timeSlots, day: "Sunday");
    AvailableDays day2 = AvailableDays(slots: timeSlots, day: "Monday");
    AvailableDays day3 = AvailableDays(slots: timeSlots, day: "Tuesday");
    AvailableDays day4 = AvailableDays(slots: timeSlots, day: "Wednesday");
    AvailableDays day5 = AvailableDays(slots: timeSlots, day: "Thursday");
    AvailableDays day6 = AvailableDays(slots: timeSlots, day: "Friday");
    AvailableDays day7 = AvailableDays(slots: timeSlots, day: "Saturday");
    availableDays.add(day1);
    availableDays.add(day2);
    availableDays.add(day3);
    availableDays.add(day4);
    availableDays.add(day5);
    availableDays.add(day6);
    availableDays.add(day7);
  }
}
