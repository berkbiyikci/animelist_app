import 'package:equatable/equatable.dart';
import 'package:kraken_animelist/features/anime/domain/entities/character.dart';
import 'package:kraken_animelist/features/anime/domain/entities/genre.dart';

class AnimeEntity extends Equatable {
  final int? id;
  final String? image;
  final String? title;
  final double? ratingScore;
  final String? synopsis;
  final int? episodes;
  final String? type;
  final List<GenreEntity>? genres;
  final List<CharacterEntity>? characters;

  const AnimeEntity({
    this.id,
    this.title,
    this.image,
    this.ratingScore,
    this.synopsis,
    this.episodes,
    this.type,
    this.characters,
    this.genres,
  });

  @override
  List<Object?> get props {
    return [
      id,
      title,
      image,
      ratingScore,
      synopsis,
      episodes,
      type,
      genres,
      characters
    ];
  }
}
