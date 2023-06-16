class JokeEntity {

  JokeEntity({
    required this.categories,
    required this.createdAt,
    required this.iconUrl,
    required this.updatedAt,
    required this.url,
    required this.value,
  });
  
  List<dynamic> categories;
  DateTime createdAt;
  String iconUrl;
  DateTime updatedAt;
  String url;
  String value;

}