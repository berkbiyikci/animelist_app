import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraken_animelist/core/constants/channel_constants.dart';
import 'package:kraken_animelist/core/constants/message_constants.dart';
import 'package:kraken_animelist/core/resources/data_state.dart';
import 'package:kraken_animelist/core/usecase/get_anime_params.dart';
import 'package:kraken_animelist/features/anime/domain/entities/anime.dart';
import 'package:kraken_animelist/features/anime/domain/usecases/get_anime_list.dart';
import 'package:kraken_animelist/features/anime/presentation/bloc/anime/anime_event.dart';
import 'package:kraken_animelist/features/anime/presentation/bloc/anime/anime_state.dart';

class AnimeListBloc extends Bloc<AnimeListEvent, AnimeListState> {
  final GetAnimeListUseCase _getAnimeListUseCase;
  static const platform = MethodChannel(ChannelConstants.animeChannelName);

  int currentPage = 1;
  bool isLoadingMore = false;

  AnimeListBloc(this._getAnimeListUseCase) : super(const AnimeListLoading()) {
    on<GetAnimeList>(onGetAnimeList);
  }

  Future<void> onGetAnimeList(
      GetAnimeList event, Emitter<AnimeListState> emit) async {
    if (isLoadingMore) return;

    if (event.page == 1) {
      emit(const AnimeListLoading());
    } else {
      isLoadingMore = true;
    }

    final comingEvent =
        await platform.invokeMethod<String>(ChannelConstants.animeMethodName);

    if (comingEvent == ChannelConstants.animeMethodName) {
      final dataState = await _getAnimeListUseCase(
        params: GetAnimeListParams(page: event.page, limit: event.limit),
      );

      if (dataState is DataSuccess &&
          dataState.data != null &&
          dataState.data!.isNotEmpty) {
        List<AnimeEntity> updatedList = [];

        if (state is AnimeListDone) {
          updatedList = List.from((state as AnimeListDone).animeList!);
        }
        updatedList.addAll(dataState.data!);

        currentPage = event.page;

        emit(AnimeListDone(updatedList));
      } else if (dataState is DataFailed) {
        emit(AnimeListError(error: dataState.error as DioException));
      }
    } else {
      emit(AnimeListError(
          message: MessageConstants.channelFailMessage(platform.name)));
    }

    isLoadingMore = false;
  }
}
