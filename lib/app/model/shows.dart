// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals

class Shows {
  int? id;
  String? name;
  Image? image;
  Rating? rating;

  Shows({
    this.id,
    this.name,
    this.image,
    this.rating,
  });

  Shows.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    name = json['name'];

    image = json['image'] != null ? new Image.fromJson(json['image']) : null;

    rating =
        json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;

    data['name'] = this.name;

    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }

    if (this.rating != null) {
      data['rating'] = this.rating!.toJson();
    }

    return data;
  }
}

class Rating {
  num? average;

  Rating({this.average});

  Rating.fromJson(Map<String, dynamic> json) {
    average = json['average'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['average'] = this.average;
    return data;
  }
}

class Image {
  String? medium;
  String? original;

  Image({this.medium, this.original});

  Image.fromJson(Map<String, dynamic> json) {
    medium = json['medium'];
    original = json['original'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['medium'] = this.medium;
    data['original'] = this.original;
    return data;
  }
}
