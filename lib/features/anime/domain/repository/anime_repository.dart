

import 'package:kraken_animelist/core/resources/data_state.dart';
import 'package:kraken_animelist/features/anime/domain/entities/anime.dart';
import 'package:kraken_animelist/features/anime/domain/entities/character.dart';

abstract class AnimeRepository{
  Future<DataState<List<AnimeEntity>>> getAnimeList({required int page, required int limit});
  Future<DataState<List<CharacterEntity>>> getCharacters({required int id});
}