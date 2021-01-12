class CharacterModel {
  int id;
  String name;
  String description;
  String thumbnail;
  String photo;

  CharacterModel({
    this.id,
    this.name,
    this.description,
    this.thumbnail,
    this.photo,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      thumbnail: json['thumbnail']['path'] +
          '/standard_xlarge.' +
          json['thumbnail']['extension'],
      photo: json['thumbnail']['path'] +
          '/portrait_uncanny.' +
          json['thumbnail']['extension'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'name': this.name,
        'description': this.description,
        'thumbnail': this.thumbnail,
        'photo': this.photo,
      };
}
