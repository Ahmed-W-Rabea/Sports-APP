import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/getPlayerModel.dart';
import '../../services/getPlayerService.dart';

part 'get_player_state.dart';

class GetPlayerCubit extends Cubit<GetPlayerState> {
  GetPlayerCubit() : super(GetPlayerInitial());

  GetPlayer getPlayerService = GetPlayer();

  late GetPlayerModel response;

  Future getPlayer({required int id}) async {
    emit(GetPlayerLoading());

    try {
      await getPlayerService.getPlayer(teamID: id).then((value) {
        if (value != null) {
          response = value;
          emit(GetPlayerSuccess());
        } else {
          emit(GetPlayerError());
        }
      });
    } catch (error) {
      emit(GetPlayerError());
    }
  }
}
