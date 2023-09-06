import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/models/getTeamModel.dart';
import 'package:meta/meta.dart';

import '../../services/getTeamService.dart';

part 'get_team_state.dart';

class GetTeamCubit extends Cubit<GetTeamState> {
  GetTeamCubit() : super(GetTeamInitial());

  GetTeam getTeamService = GetTeam();

  late GetTeamModel response;

  Future getTeam({required int id}) async {
    emit(GetTeamLoading());

    try {
      await getTeamService.getTeam(leagueID: id).then((value) {
        if (value != null) {
          response = value;
          emit(GetTeamSuccess());
        } else {
          emit(GetTeamError());
        }
      });
    } catch (error) {
      emit(GetTeamError());
    }
  }
}
