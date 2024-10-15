import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:kraken_animelist/features/anime/domain/entities/character.dart';

abstract class CharactersState extends Equatable {
  final List<CharacterEntity>? characters;
  final DioException? error;

  const CharactersState({this.characters, this.error});

  @override
  List<Object?> get props => [characters, error];
}

class CharactersLoading extends CharactersState {
  const CharactersLoading();
}

class CharactersDone extends CharactersState {
  const CharactersDone(List<CharacterEntity> characters) : super(characters: characters);
}

class CharactersError extends CharactersState {
  const CharactersError({DioException? error, String? message}) : super(error: error);
}