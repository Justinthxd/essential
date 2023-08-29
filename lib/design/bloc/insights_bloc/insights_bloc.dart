import 'package:essential/data/models/insight_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'insights_event.dart';
part 'insights_state.dart';

class InsightsBloc extends Bloc<InsightsEvent, InsightsState> {
  InsightsBloc() : super(InsightsLoadedState(const [])) {
    on<InsightsEvent>((event, emit) {
      if (event is AddInsightEvent) {
        final currentState = state as InsightsLoadedState;
        final insight = event.insight;
        final List<InsightModel> aux = [insight];
        emit(InsightsLoadedState(currentState.insights + aux));
      }
    });
  }
}
