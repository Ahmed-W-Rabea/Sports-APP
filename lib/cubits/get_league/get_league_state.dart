part of 'get_league_cubit.dart';

@immutable
sealed class GetLeagueState {
  get response => null;
}

final class GetLeagueInitial extends GetLeagueState {}

final class GetLeagueLoading extends GetLeagueState {}

final class GetLeagueSuccess extends GetLeagueState {
  final GetLeagueModel response;
  GetLeagueSuccess({required this.response});
}

final class GetLeagueError extends GetLeagueState {}
