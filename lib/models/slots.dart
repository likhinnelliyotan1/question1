class Slots {
  String? title;
  bool? available;

  Slots({this.title, this.available = false});

  Slots.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    available = json['available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = title;
    data['available'] = available;
    return data;
  }
}
