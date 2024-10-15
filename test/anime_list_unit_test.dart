import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kraken_animelist/core/resources/data_state.dart';
import 'package:kraken_animelist/core/usecase/get_anime_params.dart';
import 'package:kraken_animelist/features/anime/domain/entities/anime.dart';
import 'package:kraken_animelist/features/anime/domain/usecases/get_anime_list.dart';
import 'package:kraken_animelist/features/anime/presentation/bloc/anime/anime_bloc.dart';
import 'package:kraken_animelist/features/anime/presentation/bloc/anime/anime_event.dart';
import 'package:kraken_animelist/features/anime/presentation/bloc/anime/anime_state.dart';
import 'package:mockito/mockito.dart';

class MockGetAnimeListUseCase extends Mock implements GetAnimeListUseCase {}

void main() {
  group('AnimeListBloc', () {
    late AnimeListBloc animeListBloc;
    late MockGetAnimeListUseCase mockGetAnimeListUseCase;

    setUp(() {
      mockGetAnimeListUseCase = MockGetAnimeListUseCase();
      animeListBloc = AnimeListBloc(mockGetAnimeListUseCase);
    });

    tearDown(() {
      animeListBloc.close();
    });

    blocTest<AnimeListBloc, AnimeListState>(
      'emits [AnimeListLoading, AnimeListDone] when GetAnimeList event is added and API fetch succeeds',
      build: () {
        final params = GetAnimeListParams(page: 1, limit: 2);

        when(mockGetAnimeListUseCase.call(params: params))
            .thenAnswer((_) async => DataSuccess([
                  AnimeEntity(id: 1, title: 'Naruto', ratingScore: 8.1),
                  AnimeEntity(id: 2, title: 'One Piece', ratingScore: 8.5),
                ]));
        return animeListBloc;
      },
      act: (bloc) => bloc.add(GetAnimeList(page: 1, limit: 2)),
      expect: () => [
        AnimeListLoading(),
        AnimeListDone([
          AnimeEntity(id: 1, title: 'Naruto', ratingScore: 8.1),
          AnimeEntity(id: 2, title: 'One Piece', ratingScore: 8.5),
        ]),
      ],
    );
  });
}
