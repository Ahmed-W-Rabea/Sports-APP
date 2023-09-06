part of 'get_player_cubit.dart';

@immutable
sealed class GetPlayerState {
  get response => null;
}

final class GetPlayerInitial extends GetPlayerState {}

final class GetPlayerLoading extends GetPlayerState {}

final class GetPlayerSuccess extends GetPlayerState {}

final class GetPlayerError extends GetPlayerState {}
