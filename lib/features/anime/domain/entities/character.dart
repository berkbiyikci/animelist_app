import 'package:equatable/equatable.dart';

class CharacterEntity extends Equatable {
  final int? malId;
  final String? url;
  final String? image;
  final String? name;
  final String? role;

  const CharacterEntity({
    this.malId,
    this.url,
    this.image,
    this.name,
    this.role,
  });

  @override
  List<Object?> get props {
    return [
      malId,
      url,
      image,
      name,
      role,
    ];
  }
}
