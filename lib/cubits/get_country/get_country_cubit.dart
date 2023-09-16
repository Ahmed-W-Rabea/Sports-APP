import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/models/getCountryModel.dart';
import 'package:meta/meta.dart';

import '../../services/getCountryService.dart';

part 'get_country_state.dart';

class GetCountryCubit extends Cubit<GetCountryState> {
  GetCountryCubit() : super(GetCountryInitial());

  GetCountry getCountryService = GetCountry();

  getCountry() async {
    emit(GetCountryLoading());

    try {
      await getCountryService.getCountry().then((value) {
        if (value != null) {
          emit(GetCountrySuccess(response: value));
        } else {
          emit(GetCountryError());
        }
      });
    } catch (error) {
      emit(GetCountryError());
    }
  }
}
