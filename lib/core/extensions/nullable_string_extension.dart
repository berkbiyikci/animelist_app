import 'package:kraken_animelist/core/constants/message_constants.dart';

extension NullableStringExtension on String? {
  String get nullText {
    return this ?? MessageConstants.textNotFound;
  }

  String get nullImage {
    return this ?? MessageConstants.imageNotFound;
  }
}