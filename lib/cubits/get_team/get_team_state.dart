part of 'get_team_cubit.dart';

@immutable
sealed class GetTeamState {
  get response => null;
}

final class GetTeamInitial extends GetTeamState {}

final class GetTeamLoading extends GetTeamState {}

final class GetTeamSuccess extends GetTeamState {}

final class GetTeamError extends GetTeamState {}
