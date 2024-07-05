class Postgetmodel {
  int? userId;
  int? id;
  String? title;
  String? body;

  Postgetmodel({this.userId, this.id, this.title, this.body});

  Postgetmodel.fromJson(dynamic json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
