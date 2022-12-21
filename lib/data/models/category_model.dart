class CategoryModel {
  int id;
  String incomeType;
  String icon;
  String color;

  CategoryModel({
    required this.id,
    required this.incomeType,
    required this.icon,
    required this.color,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> jsonData) {
    return CategoryModel(
      id: jsonData['id'] as int? ?? 0,
      incomeType: jsonData['income_type'] as String? ?? '',
      icon: jsonData['icon'] as String? ?? '',
      color: jsonData['color'] as String? ?? '',
    );
  }
}
