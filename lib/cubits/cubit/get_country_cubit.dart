import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/models/getCountryModel.dart';
import 'package:meta/meta.dart';

import '../../services/getCountryService.dart';

part 'get_country_state.dart';

class GetCountryCubit extends Cubit<GetCountryState> {
  GetCountryCubit() : super(GetCountryInitial());

  GetCountry newsRepo = GetCountry();

  getNews() async {
    emit(GetCountriesLoading());

    try {
      await newsRepo.getCountry().then((value) {
        if (value != null) {
          emit(GetNewsSuccess(response: value));
        } else {
          emit(GetNewsError());
        }
      });
    } catch (error) {
      emit(GetNewsError());
    }
  }
}
