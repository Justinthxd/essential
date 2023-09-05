part of 'category_bloc.dart';

@immutable
sealed class CategoryState {}

final class CategoryLoadedState extends CategoryState {
  final List<CategoryModel> categories;

  CategoryLoadedState(this.categories);
}
