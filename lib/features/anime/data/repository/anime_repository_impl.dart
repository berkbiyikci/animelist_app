import 'dart:io';

import 'package:dio/dio.dart';
import 'package:kraken_animelist/core/resources/data_state.dart';
import 'package:kraken_animelist/features/anime/data/data_sources/remote/anime_api_service.dart';
import 'package:kraken_animelist/features/anime/data/models/anime.dart';
import 'package:kraken_animelist/features/anime/data/models/character.dart';
import 'package:kraken_animelist/features/anime/domain/repository/anime_repository.dart';

class AnimeRepositoryImpl extends AnimeRepository {
  final AnimeApiService _animeApiService;

  AnimeRepositoryImpl(this._animeApiService);

  @override
  Future<DataState<List<AnimeModel>>> getAnimeList(
      {required int page, required int limit}) async {
    try {
      final httpResponse =
          await _animeApiService.getAnimeList(page: page, limit: limit);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.data);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      print(e);
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<CharacterModel>>> getCharacters(
      {required int id}) async {
    try {
      final httpResponse = await _animeApiService.getCharacters(id: id);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.data);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      print(e);
      return DataFailed(e);
    }
  }
}
