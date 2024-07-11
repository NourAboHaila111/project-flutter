class Productsmodel {
  int? id;
  String? title;
  String? image;
  Null? date;

  Productsmodel({this.id, this.title, this.image, this.date});

  Productsmodel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    date = json['date'];
}}