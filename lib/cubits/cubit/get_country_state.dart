part of 'get_country_cubit.dart';

@immutable
sealed class GetCountryState {}

final class GetCountryInitial extends GetCountryState {}

final class GetCountryLoading extends GetCountryState {}

final class GetCountrySuccess extends GetCountryState {
  final GetNewCountryModel response;
  GetCountrySuccess({required this.response});
}

final class GetCountryError extends GetCountryState {}
