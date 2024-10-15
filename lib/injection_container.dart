import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:kraken_animelist/config/localization/app_locales.dart';
import 'package:kraken_animelist/core/services/localization_service.dart';
import 'package:kraken_animelist/features/anime/data/data_sources/remote/anime_api_service.dart';
import 'package:kraken_animelist/features/anime/data/repository/anime_repository_impl.dart';
import 'package:kraken_animelist/features/anime/domain/repository/anime_repository.dart';
import 'package:kraken_animelist/features/anime/domain/usecases/get_anime_list.dart';
import 'package:kraken_animelist/features/anime/domain/usecases/get_characters.dart';
import 'package:kraken_animelist/features/anime/presentation/bloc/anime/anime_bloc.dart';
import 'package:kraken_animelist/features/anime/presentation/bloc/characters/characters_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<AnimeApiService>(AnimeApiService(sl()));
  sl.registerSingleton<AnimeRepository>(AnimeRepositoryImpl(sl()));

  //UseCases
  sl.registerSingleton<GetAnimeListUseCase>(GetAnimeListUseCase(sl()));
  sl.registerSingleton<GetCharactersUseCase>(GetCharactersUseCase(sl()));

  //Blocs
  sl.registerFactory<AnimeListBloc>(() => AnimeListBloc(sl()));
  sl.registerFactory<CharactersBloc>(() => CharactersBloc(sl()));
}
