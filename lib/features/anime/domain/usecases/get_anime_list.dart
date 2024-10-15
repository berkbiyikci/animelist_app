import 'package:kraken_animelist/core/resources/data_state.dart';
import 'package:kraken_animelist/core/usecase/usecase.dart';
import 'package:kraken_animelist/features/anime/domain/entities/anime.dart';
import 'package:kraken_animelist/features/anime/domain/repository/anime_repository.dart';
import 'package:kraken_animelist/core/usecase/get_anime_params.dart';

class GetAnimeListUseCase implements UseCase<DataState<List<AnimeEntity>>, GetAnimeListParams> {
  final AnimeRepository _animeRepository;

  GetAnimeListUseCase(this._animeRepository);

  @override
  Future<DataState<List<AnimeEntity>>> call({required GetAnimeListParams params}) {
    return _animeRepository.getAnimeList(page: params.page, limit: params.limit);
  }
}
