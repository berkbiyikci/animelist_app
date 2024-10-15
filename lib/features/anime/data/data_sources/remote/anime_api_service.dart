import 'package:dio/dio.dart';
import 'package:kraken_animelist/core/constants/api_constants.dart';
import 'package:kraken_animelist/core/constants/query_constants.dart';
import 'package:kraken_animelist/features/anime/data/enums/anime_type.dart';
import 'package:kraken_animelist/features/anime/data/enums/rating.dart';
import 'package:kraken_animelist/features/anime/data/enums/top_anime_filter.dart';
import 'package:kraken_animelist/features/anime/data/models/anime_list_response.dart';
import 'package:kraken_animelist/features/anime/data/models/character_response.dart';
import 'package:retrofit/retrofit.dart';

part "anime_api_service.g.dart";

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AnimeApiService {
  factory AnimeApiService(Dio dio) = _AnimeApiService;

  @GET(ApiConstants.animeList)
  Future<HttpResponse<AnimeListResponseModel>> getAnimeList({
    @Query(QueryConstants.typeQuery) AnimeType? type,
    @Query(QueryConstants.filterQuery) TopAnimeFilter? filter,
    @Query(QueryConstants.ratingQuery) AnimeRating? rating,
    @Query(QueryConstants.sfwQuery) bool? sfw,
    @Query(QueryConstants.pageQuery) int? page,
    @Query(QueryConstants.limitQuery) int? limit,
  });

  @GET("${ApiConstants.anime}/{id}/${ApiConstants.characters}")
  Future<HttpResponse<CharacterListResponseModel>> getCharacters({
    @Path("id") int? id,
  });
}
