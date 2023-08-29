import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'insights_event.dart';
part 'insights_state.dart';

class InsightsBloc extends Bloc<InsightsEvent, InsightsState> {
  InsightsBloc() : super(InsightsInitial()) {
    on<InsightsEvent>((event, emit) {});
  }
}
