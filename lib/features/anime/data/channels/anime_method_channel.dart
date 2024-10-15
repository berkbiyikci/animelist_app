// anime_method_channel.dart
import 'package:flutter/services.dart';
// i_anime_method_channel.dart
import 'package:flutter/services.dart';

abstract class IAnimeMethodChannel {
  Future<List<dynamic>> fetchAnimeList();
}


class AnimeMethodChannel implements IAnimeMethodChannel {
  final MethodChannel platform = const MethodChannel('com.example.krakenanimelist');

  /// Invokes the 'fetchAnimeList' method on the native platform and returns the data.
  @override
  Future<List<dynamic>> fetchAnimeList() async {
    try {
      final List<dynamic> animeList = await platform.invokeMethod('fetchAnimeList');
      return animeList;
    } on PlatformException catch (e) {
      print('Failed to invoke fetchAnimeList: ${e.message}');
      throw e;
    }
  }
}
