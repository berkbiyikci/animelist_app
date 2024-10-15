import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraken_animelist/config/routes/routes.dart';
import 'package:kraken_animelist/core/constants/api_constants.dart';
import 'package:kraken_animelist/core/constants/app_constants.dart';
import 'package:kraken_animelist/core/services/navigate.dart';
import 'package:kraken_animelist/features/anime/domain/entities/anime.dart';
import 'package:kraken_animelist/features/anime/presentation/bloc/anime/anime_bloc.dart';
import 'package:kraken_animelist/features/anime/presentation/bloc/anime/anime_event.dart';
import 'package:kraken_animelist/features/anime/presentation/bloc/anime/anime_state.dart';
import 'package:kraken_animelist/features/anime/presentation/widgets/anime_tile.dart';

class AnimeList extends StatefulWidget {
  const AnimeList({Key? key}) : super(key: key);

  @override
  _AnimeListState createState() => _AnimeListState();
}

class _AnimeListState extends State<AnimeList> {
  final ScrollController _scrollController = ScrollController();
  late AnimeListBloc _animeListBloc;
  int _currentPage = ApiConstants.defaultPage;
  final int _limit = ApiConstants.defaultLimit;

  @override
  void initState() {
    super.initState();
    _animeListBloc = BlocProvider.of<AnimeListBloc>(context);
    _animeListBloc.add(GetAnimeList(page: _currentPage, limit: _limit));
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    _currentPage = ApiConstants.defaultPage;
    _animeListBloc.add(GetAnimeList(page: _currentPage, limit: _limit));
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _currentPage++;
      _animeListBloc.add(GetAnimeList(page: _currentPage, limit: _limit));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(),
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
      title: const Text(
        AppConstants.appTitle,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  _buildBody() {
    return BlocBuilder<AnimeListBloc, AnimeListState>(
      builder: (_, state) {
        if (state is AnimeListLoading && state.animeList == null) {
          return const Center(child: CupertinoActivityIndicator());
        }

        if (state is AnimeListError) {
          return const Center(child: Icon(Icons.refresh));
        }

        if (state is AnimeListDone) {
          return CustomScrollView(
            controller: _scrollController, // Attach scroll controller
            physics: BouncingScrollPhysics(),
            slivers: [
              CupertinoSliverRefreshControl(
                onRefresh: _onRefresh,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    if (index == state.animeList!.length) {
                      return const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(child: CupertinoActivityIndicator()),
                      ); // Show loading spinner at the bottom
                    }

                    return AnimeWidget(
                      anime: state.animeList![index],
                      onAnimePressed: (anime) =>
                          _onAnimePressed(context, anime),
                    );
                  },
                  childCount: state.animeList!.length +
                      1, // Account for pagination loader
                ),
              ),
            ],
          );
        }

        return const SizedBox();
      },
    );
  }

  void _onAnimePressed(BuildContext context, AnimeEntity anime) {
    Navigate.pushNamed(root: AppRoutes.animeDetailsRoute, arg: anime);
  }
}
