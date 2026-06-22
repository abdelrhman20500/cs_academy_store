
class ProductModel {
  int? id;
  String? title;
  String? description;
  double? price;
  double? rating;
  List<String>? images;

  ProductModel({this.id, this.title, this.description,this.price,this.rating, this.images,});

  ProductModel.fromJson(Map<String, dynamic> json) {
    if(json["id"] is num) {
      id = (json["id"] as num).toInt();
    }
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["description"] is String) {
      description = json["description"];
    }
    if(json["price"] is num) {
      price = (json["price"] as num).toDouble();
    }
    if(json["rating"] is num) {
      rating = (json["rating"] as num).toDouble();
    }
    if(json["images"] is List) {
      images = json["images"] == null ? null : List<String>.from(json["images"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["title"] = title;
    data["description"] = description;
    data["price"] = price;
    data["rating"] = rating;
    if(images != null) {
      data["images"] = images;
    }
    return data;
  }
}



