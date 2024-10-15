import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraken_animelist/core/resources/data_state.dart';
import 'package:kraken_animelist/core/usecase/get_characters_params.dart';
import 'package:kraken_animelist/features/anime/domain/usecases/get_characters.dart';
import 'package:kraken_animelist/features/anime/presentation/bloc/characters/characters_event.dart';
import 'package:kraken_animelist/features/anime/presentation/bloc/characters/characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final GetCharactersUseCase _getCharactersUseCase;

  CharactersBloc(this._getCharactersUseCase)
      : super(const CharactersLoading()) {
    on<GetCharacters>(onGetCharacters);
  }

  Future<void> onGetCharacters(
      GetCharacters event, Emitter<CharactersState> emit) async {
    emit(const CharactersLoading());

    final dataState = await _getCharactersUseCase(
      params: GetCharactersParams(id: event.id!),
    );

    if (dataState is DataSuccess &&
        dataState.data != null &&
        dataState.data!.isNotEmpty) {
      emit(CharactersDone(dataState.data!));
    } else if (dataState is DataFailed) {
      emit(CharactersError(error: dataState.error as DioException));
    }
  }
}
