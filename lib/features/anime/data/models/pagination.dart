import 'package:kraken_animelist/features/anime/data/models/pagination_items.dart';

class PaginationModel {
  final int lastVisiblePage;
  final bool hasNextPage;
  final int currentPage;
  final PaginationItemsModel items;

  PaginationModel({
    required this.lastVisiblePage,
    required this.hasNextPage,
    required this.currentPage,
    required this.items,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) {
    return PaginationModel(
      lastVisiblePage: json['last_visible_page'] ?? 0,
      hasNextPage: json['has_next_page'] ?? false,
      currentPage: json['current_page'] ?? 0,
      items: json['items'] != null
          ? PaginationItemsModel.fromJson(json['items'])
          : PaginationItemsModel(count: 0, total: 0, perPage: 0),
    );
  }
}
