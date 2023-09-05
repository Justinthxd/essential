class CategoryModel {
  final String id;
  final String title;

  const CategoryModel({
    this.id = '',
    this.title = 'Default',
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      title: json['title'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'id': id,
    };
  }

  @override
  String toString() {
    return 'CategoryModel(title: $title, id: $id)';
  }
}
