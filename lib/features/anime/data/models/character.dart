import 'package:kraken_animelist/features/anime/domain/entities/character.dart';

class CharacterModel extends CharacterEntity {
  const CharacterModel({
    required int malId,
    required String image,
    required String name,
    required String role,
  }) : super(
          malId: malId,
          image: image,
          name: name,
          role: role,
        );

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    final characterModel = CharacterModel(
      role: json['role'] ?? '',
      name: json["character"]['name'] ?? '',
      malId: json["character"]['mal_id'] ?? 0,
      image: json["character"]['images']["jpg"]["image_url"] ?? '',
    );
    return characterModel;
  }
}
