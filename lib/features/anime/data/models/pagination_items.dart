class PaginationItemsModel {
  final int count;
  final int total;
  final int perPage;

  PaginationItemsModel({
    required this.count,
    required this.total,
    required this.perPage,
  });

  factory PaginationItemsModel.fromJson(Map<String, dynamic> json) {
    return PaginationItemsModel(
      count: json['count'] ?? 0,
      total: json['total'] ?? 0,
      perPage: json['per_page'] ?? 0,
    );
  }
}
