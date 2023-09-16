import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/models/getLeagueModel.dart';
import 'package:meta/meta.dart';

import '../../services/getLeagueService.dart';

part 'get_league_state.dart';

class GetLeagueCubit extends Cubit<GetLeagueState> {
  GetLeagueCubit() : super(GetLeagueInitial());

  GetLeague getLeagueService = GetLeague();

  getLeague() async {
    emit(GetLeagueLoading());

    try {
      await getLeagueService.getLeague().then((value) {
        if (value != null) {
          emit(GetLeagueSuccess(response: value));
        } else {
          emit(GetLeagueError());
        }
      });
    } catch (error) {
      emit(GetLeagueError());
    }
  }
}
