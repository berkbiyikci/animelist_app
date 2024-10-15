abstract class CharactersEvent {
  const CharactersEvent();
}

class GetCharacters extends CharactersEvent {
  final int? id;
  GetCharacters({ this.id});
}


class ClearCharacters extends CharactersEvent {
  ClearCharacters();
}