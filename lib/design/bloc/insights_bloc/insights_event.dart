part of 'insights_bloc.dart';

@immutable
sealed class InsightsEvent {}

final class AddInsightEvent extends InsightsEvent {
  final InsightModel insight;

  AddInsightEvent(this.insight);
}
