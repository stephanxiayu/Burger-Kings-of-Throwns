
class ThomasCharacter {
  final String url;
  final String name;
  final String gender;
  final String culture;
  final String born;
  final String died;
  final List<String> titles;
  final List<String> aliases;
  final String father;
  final String mother;
  final String spouse;
  final List<String> allegiances;
  final List<String> books;
  final List<String> povBooks;
  final List<String> tvSeries;
  final List<String> playedBy;

  ThomasCharacter({
    required this.url,
    required this.name,
    required this.gender,
    required this.culture,
    required this.born,
    required this.died,
    required this.titles,
    required this.aliases,
    required this.father,
    required this.mother,
    required this.spouse,
    required this.allegiances,
    required this.books,
    required this.povBooks,
    required this.tvSeries,
    required this.playedBy,
  });

  factory ThomasCharacter.fromJson(Map<String, dynamic> json) {
    return ThomasCharacter(
      url: json['url'] as String,
      name: json['name'] as String,
      gender: json['gender'] as String,
      culture: json['culture'] as String,
      born: json['born'] as String,
      died: json['died'] as String,
      titles: List<String>.from(json['titles']),
      aliases: List<String>.from(json['aliases']),
      father: json['father'] as String,
      mother: json['mother'] as String,
      spouse: json['spouse'] as String,
      allegiances: List<String>.from(json['allegiances']),
      books: List<String>.from(json['books']),
      povBooks: List<String>.from(json['povBooks']),
      tvSeries: List<String>.from(json['tvSeries']),
      playedBy: List<String>.from(json['playedBy']),
    );
  }
}
