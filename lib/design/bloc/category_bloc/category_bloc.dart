import 'package:essential/data/models/category_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc()
      : super(CategoryLoadedState(
          const [CategoryModel(title: 'Default')],
        )) {
    on<CategoryEvent>((event, emit) {
      if (event is AddCategoryEvent) {
        final currentState = state as CategoryLoadedState;

        emit(CategoryLoadedState([event.category, ...currentState.categories]));
      }
    });
  }
}
