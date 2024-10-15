enum AnimeRating {
  g('G - All Ages'),
  pg('PG - Children'),
  pg13('PG-13 - Teens 13 or older'),
  r17('R - 17+ (violence & profanity)'),
  r('R+ - Mild Nudity'),
  rx('Rx - Hentai');

  final String description;

  const AnimeRating(this.description);
}
