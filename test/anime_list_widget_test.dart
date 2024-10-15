import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kraken_animelist/features/anime/presentation/bloc/anime/anime_bloc.dart';
import 'package:kraken_animelist/features/anime/presentation/bloc/anime/anime_event.dart';
import 'package:kraken_animelist/features/anime/presentation/bloc/anime/anime_state.dart';
import 'package:kraken_animelist/features/anime/presentation/pages/home/anime_list.dart';

class MockAnimeListBloc extends MockBloc<AnimeListEvent, AnimeListState>
    implements AnimeListBloc {}

void main() {
  late MockAnimeListBloc mockAnimeListBloc;

  setUp(() {
    mockAnimeListBloc = MockAnimeListBloc();
  });

  tearDown(() {
    mockAnimeListBloc.close();
  });

  testWidgets('AnimeList page shows loading indicator initially',
      (WidgetTester tester) async {
    // Arrange
    whenListen(
      mockAnimeListBloc,
      Stream.fromIterable([AnimeListLoading()]),
      initialState: AnimeListLoading(),
    );

    // Act
    await tester.pumpWidget(
      BlocProvider<AnimeListBloc>(
        create: (context) => mockAnimeListBloc,
        child: const MaterialApp(home: AnimeList()),
      ),
    );

    // Assert
    expect(find.byType(CupertinoActivityIndicator), findsOneWidget);
  });
}
