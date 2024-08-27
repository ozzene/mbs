class CategoryModel {
  final int id;
  final String name;
  final String description;
  final List<CategoryModel> category;
  bool isSelected;

  CategoryModel({
    required this.id,
    required this.name,
    required this.description,
    this.category = const [],
    this.isSelected = false,
  });
}