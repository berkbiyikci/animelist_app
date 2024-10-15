import 'package:flutter/material.dart';
import 'package:kraken_animelist/features/anime/domain/entities/anime.dart';
import 'package:kraken_animelist/features/anime/presentation/pages/anime_detail/anime_detail.dart';
import 'package:kraken_animelist/features/anime/presentation/pages/home/anime_list.dart';

class AppRoutes {

  static const String homeRoute = '/';
  static const String animeDetailsRoute = '/AnimeDetails';



  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return _materialRoute(const AnimeList());

      case animeDetailsRoute:
        return _materialRoute(
            AnimeDetailsView(anime: settings.arguments as AnimeEntity));

      default:
        return _materialRoute(const AnimeList());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
