class CharacterModel {
  final String? description;
  final int id;
  final String? firstName;
  final String? lastName;
  final String? fullName;
  final String? title;
  final String? family;
  final String? image;
  final String? imageUrl;

  CharacterModel({
    required this.description,
    required this.id,
    this.firstName,
    this.lastName,
    this.fullName,
    this.title,
    this.family,
    this.image,
    this.imageUrl,
  });

  // Convert a JSON object into a CharacterModel
  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      description: json['description'],
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      fullName: json['fullName'],
      title: json['title'],
      family: json['family'],
      image: json['image'],
      imageUrl: json['imageUrl'],
    );
  }

  // Convert a CharacterModel into a JSON object
  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'fullName': fullName,
      'title': title,
      'family': family,
      'image': image,
      'imageUrl': imageUrl,
    };
  }
}
