part of 'get_news_cubit.dart';

@immutable
sealed class GetNewsState {
  get response => null;
}

final class GetNewsInitial extends GetNewsState {}

final class GetNewsLoading extends GetNewsState {}

final class GetNewsSuccess extends GetNewsState {
  @override
  final NewsModel response;
  GetNewsSuccess({required this.response});
}

final class GetNewsError extends GetNewsState {}
