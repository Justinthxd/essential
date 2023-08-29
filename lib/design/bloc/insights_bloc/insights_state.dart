part of 'insights_bloc.dart';

@immutable
sealed class InsightsState {}

final class InsightsInitialState extends InsightsState {}

final class InsightsLoadedState extends InsightsState {
  final List<InsightModel> insights;

  InsightsLoadedState(this.insights);
}
