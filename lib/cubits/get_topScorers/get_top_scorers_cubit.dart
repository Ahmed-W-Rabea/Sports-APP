import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/getTopScorersModel.dart';
import '../../services/getTopScorersService.dart';

part 'get_top_scorers_state.dart';

class GetTopScorersCubit extends Cubit<GetTopScorersState> {
  GetTopScorersCubit() : super(GetTopScorersInitial());

  GetTopScorers getTopScorersService = GetTopScorers();

  late GetTopScorersModel response;

  Future getTopScorers({required int id2}) async {
    emit(GetTopScorersLoading());

    try {
      await getTopScorersService.getTopScorers(leagueID2: id2).then((value) {
        if (value != null) {
          response = value;
          emit(GetTopScorersSuccess());
        } else {
          emit(GetTopScorersError());
        }
      });
    } catch (error) {
      emit(GetTopScorersError());
    }
  }
}
