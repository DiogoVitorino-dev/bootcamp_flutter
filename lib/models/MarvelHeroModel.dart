class MarvelHeroModel {
  int id = 0;
  String name = "";
  String description = "";
  String modified = "";
  Thumbnail thumbnail = Thumbnail(path: "",extension: "");

  MarvelHeroModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.modified,
      required this.thumbnail});

  MarvelHeroModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    modified = json['modified'];
    thumbnail = Thumbnail.fromJson(json['thumbnail']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['modified'] = this.modified;
    data['thumbnail'] = this.thumbnail.toJson();
    return data;
  }
}

class Thumbnail {
  String path = "";
  String extension = "";

  Thumbnail({required this.path, required this.extension});

  Thumbnail.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    extension = json['extension'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['path'] = this.path;
    data['extension'] = this.extension;
    return data;
  }
}
