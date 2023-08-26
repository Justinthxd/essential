import 'package:flutter_bloc/flutter_bloc.dart';

part 'expenses_event.dart';
part 'expenses_state.dart';

class ExpensesBloc extends Bloc<ExpensesEvent, ExpensesState> {
  ExpensesBloc() : super(ExpensesInitialState()) {
    on<ExpensesEvent>((event, emit) {});
  }
}
