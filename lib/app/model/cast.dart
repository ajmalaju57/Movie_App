// ignore_for_file: unnecessary_question_mark, unnecessary_new, prefer_collection_literals, unnecessary_this

class Cast {
  Person? person;
  Character? character;
  bool? self;
  bool? voice;

  Cast({this.person, this.character, this.self, this.voice});

  Cast.fromJson(Map<String, dynamic> json) {
    person =
        json['person'] != null ? new Person.fromJson(json['person']) : null;
    character = json['character'] != null
        ? new Character.fromJson(json['character'])
        : null;
    self = json['self'];
    voice = json['voice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.person != null) {
      data['person'] = this.person!.toJson();
    }
    if (this.character != null) {
      data['character'] = this.character!.toJson();
    }
    data['self'] = this.self;
    data['voice'] = this.voice;
    return data;
  }
}

class Person {
  int? id;
  String? url;
  String? name;
  Country? country;
  String? birthday;
  Null? deathday;
  String? gender;
  Image? image;
  int? updated;
  Links? lLinks;

  Person(
      {this.id,
      this.url,
      this.name,
      this.country,
      this.birthday,
      this.deathday,
      this.gender,
      this.image,
      this.updated,
      this.lLinks});

  Person.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    name = json['name'];
    country =
        json['country'] != null ? new Country.fromJson(json['country']) : null;
    birthday = json['birthday'];
    deathday = json['deathday'];
    gender = json['gender'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    updated = json['updated'];
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['name'] = this.name;
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    data['birthday'] = this.birthday;
    data['deathday'] = this.deathday;
    data['gender'] = this.gender;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['updated'] = this.updated;
    if (this.lLinks != null) {
      data['_links'] = this.lLinks!.toJson();
    }
    return data;
  }
}

class Country {
  String? name;
  String? code;
  String? timezone;

  Country({this.name, this.code, this.timezone});

  Country.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['code'] = this.code;
    data['timezone'] = this.timezone;
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

class Links {
  Self? self;

  Links({this.self});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'] != null ? new Self.fromJson(json['self']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.self != null) {
      data['self'] = this.self!.toJson();
    }
    return data;
  }
}

class Self {
  String? href;

  Self({this.href});

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}

class Character {
  int? id;
  String? url;
  String? name;
  Image? image;
  Links? lLinks;

  Character({this.id, this.url, this.name, this.image, this.lLinks});

  Character.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    name = json['name'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['name'] = this.name;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    if (this.lLinks != null) {
      data['_links'] = this.lLinks!.toJson();
    }
    return data;
  }
}
