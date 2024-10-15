import 'package:kraken_animelist/features/anime/data/models/character.dart';

class CharacterListResponseModel {
  final List<CharacterModel> data;

  CharacterListResponseModel({
    required this.data,
  });

  factory CharacterListResponseModel.fromJson(Map<String, dynamic> json) {
    final characterList = CharacterListResponseModel(
      data: (json['data'] as List)
          .map((characterJson) => CharacterModel.fromJson(characterJson))
          .toList(),
    );

    return characterList;
  }
}
