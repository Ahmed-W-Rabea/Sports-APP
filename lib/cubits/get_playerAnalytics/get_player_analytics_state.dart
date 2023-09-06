part of 'get_player_analytics_cubit.dart';

@immutable
sealed class GetPlayerAnalyticsState {
  get response => null;
}

final class GetPlayerAnalyticsInitial extends GetPlayerAnalyticsState {}

final class GetPlayerAnalyticsLoading extends GetPlayerAnalyticsState {}

final class GetPlayerAnalyticsSuccess extends GetPlayerAnalyticsState {}

final class GetPlayerAnalyticsError extends GetPlayerAnalyticsState {}
