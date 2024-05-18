class Goal {
  final String title;
  final String detail;

  Goal(this.title, this.detail);

  Goal.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        detail = json['detail'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'detail': detail,
      };
}
