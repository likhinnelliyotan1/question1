import 'package:question1/models/availabledays.dart';
class Days {
  List<AvailableDays>? days;
  Days({this.days});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String,dynamic>();
    if (days != null) {
      data['data'] = days!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
