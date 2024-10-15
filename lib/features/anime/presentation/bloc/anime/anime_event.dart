abstract class AnimeListEvent {
  const AnimeListEvent();
}

class GetAnimeList extends AnimeListEvent {
  final int page;
  final int limit;

  GetAnimeList({required this.page, required this.limit});
}