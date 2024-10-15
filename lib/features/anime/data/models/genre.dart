import 'package:kraken_animelist/features/anime/domain/entities/genre.dart';

class GenreModel extends GenreEntity {
  final int id;
  final String name;
  final String url;

  GenreModel({
    required this.id,
    required this.name,
    required this.url,
  });

  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(
      id: json['mal_id'] ?? 0,
      name: json['name'] ?? '',
      url: json['url'] ?? '',
    );
  }
}
