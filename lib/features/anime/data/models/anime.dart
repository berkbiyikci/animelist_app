import 'package:kraken_animelist/features/anime/data/models/genre.dart';
import 'package:kraken_animelist/features/anime/domain/entities/anime.dart';

class AnimeModel extends AnimeEntity {
  const AnimeModel({
    required int id,
    required String image,
    required String title,
    required double ratingScore,
    required String synopsis,
    required int episodes,
    required String type,
    required List<GenreModel> genres,
    // Add other fields as necessary
  }) : super(
          id: id,
          image: image,
          title: title,
          ratingScore: ratingScore,
          synopsis: synopsis,
          episodes: episodes,
          type: type,
          genres: genres,
          // Add other fields as necessary
        );

  factory AnimeModel.fromJson(Map<String, dynamic> json) {
    return AnimeModel(
      id: json['mal_id'] ?? 0,
      image: json['images'] != null
          ? json['images']['jpg']['image_url'] ?? ''
          : '',
      title: json['title'] ?? '',
      ratingScore:
          (json['score'] != null) ? (json['score'] as num).toDouble() : 0.0,
      synopsis: json['synopsis'] ?? '',
      episodes: json['episodes'] ?? 0,
      type: json['type'] ?? '',
      genres: json['genres'] != null
          ? (json['genres'] as List<dynamic>)
              .map<GenreModel>((genreJson) => GenreModel.fromJson(genreJson))
              .toList()
          : [],
    );
  }
}
