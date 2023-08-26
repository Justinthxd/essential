import 'package:essential/data/models/budget_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'incomes_event.dart';
part 'incomes_state.dart';

class IncomesBloc extends Bloc<IncomesEvent, IncomesState> {
  IncomesBloc() : super(IncomesInitialState()) {
    on<IncomesEvent>((event, emit) {
      if (event is AddIncomesEvent) {
        final currentState = state as AddIncomesState;

        final incomes = currentState.incomes.copyWith(
          incomes: event.incomes,
        );
        emit(AddIncomesState(incomes));
      }
    });
  }
}
