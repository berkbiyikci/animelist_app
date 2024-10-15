import 'package:kraken_animelist/core/resources/data_state.dart';
import 'package:kraken_animelist/core/usecase/get_characters_params.dart';
import 'package:kraken_animelist/core/usecase/usecase.dart';
import 'package:kraken_animelist/features/anime/domain/entities/character.dart';
import 'package:kraken_animelist/features/anime/domain/repository/anime_repository.dart';

class GetCharactersUseCase
    implements UseCase<DataState<List<CharacterEntity>>, GetCharactersParams> {
  final AnimeRepository _animeRepository;

  GetCharactersUseCase(this._animeRepository);

  @override
  Future<DataState<List<CharacterEntity>>> call(
      {required GetCharactersParams params}) {
    return _animeRepository.getCharacters(id: params.id);
  }
}
