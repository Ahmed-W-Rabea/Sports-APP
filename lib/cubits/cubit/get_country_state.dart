part of 'get_country_cubit.dart';

@immutable
sealed class GetCountryState {}

final class GetCountryInitial extends GetCountryState {}

final class GetCountriesLoading extends GetCountryState {}

final class GetNewsSuccess extends GetCountryState {
  final GetNewCountryModel response;
  GetNewsSuccess({required this.response});
}

final class GetNewsError extends GetCountryState {}
