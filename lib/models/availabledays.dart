import 'slots.dart';

class AvailableDays {
  String? id;
  String? day;
  bool? available;
  List<Slots>? slots;

  AvailableDays({this.id, this.day, this.available = true, this.slots});

  AvailableDays.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    day = json['day'];
    available = json['available'];
    if (json['slots'] != null) {
      slots = <Slots>[];
      json['slots'].forEach((v) {
        slots!.add( Slots.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String,dynamic>();
    data['id'] = id;
    data['day'] = day;
    data['available'] = available;
    if (slots != null) {
      data['slots'] = slots!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
