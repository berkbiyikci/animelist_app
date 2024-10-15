import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:kraken_animelist/features/anime/domain/entities/anime.dart';

abstract class AnimeListState extends Equatable {
  final List<AnimeEntity>? animeList;
  final DioException? error;

  const AnimeListState({this.animeList, this.error});

  @override
  List<Object?> get props => [animeList, error];
}

class AnimeListLoading extends AnimeListState {
  const AnimeListLoading();
}

class AnimeListDone extends AnimeListState {
  const AnimeListDone(List<AnimeEntity> animeList) : super(animeList: animeList);
}

class AnimeListError extends AnimeListState {
  const AnimeListError({DioException? error, String? message}) : super(error: error);
}
