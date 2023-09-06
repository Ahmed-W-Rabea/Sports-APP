part of 'get_top_scorers_cubit.dart';

@immutable
sealed class GetTopScorersState {
  get response => null;
}

final class GetTopScorersInitial extends GetTopScorersState {}

final class GetTopScorersLoading extends GetTopScorersState {}

final class GetTopScorersSuccess extends GetTopScorersState {}

final class GetTopScorersError extends GetTopScorersState {}
