import 'package:kraken_animelist/features/anime/data/models/pagination.dart';

import 'anime.dart';

class AnimeListResponseModel {
  final PaginationModel pagination;
  final List<AnimeModel> data;

  AnimeListResponseModel({
    required this.pagination,
    required this.data,
  });

  factory AnimeListResponseModel.fromJson(Map<String, dynamic> json) {
    return AnimeListResponseModel(
      pagination: PaginationModel.fromJson(json['pagination']),
      data: (json['data'] as List)
          .map((animeJson) => AnimeModel.fromJson(animeJson))
          .toList(),
    );
  }
}