import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/getPlayerAnalyticsModel.dart';
import '../../services/getPlayerAnalyticsService.dart';

part 'get_player_analytics_state.dart';

class GetPlayerAnalyticsCubit extends Cubit<GetPlayerAnalyticsState> {
  GetPlayerAnalyticsCubit() : super(GetPlayerAnalyticsInitial());

  GetPlayerAnalytics getPlayerAnalyticsService = GetPlayerAnalytics();

  late GetPlayerAnalyticsModel response;

  Future getPlayerAnalytics({required int id}) async {
    emit(GetPlayerAnalyticsLoading());

    try {
      await getPlayerAnalyticsService
          .getPlayerAnalytics(playerID: id)
          .then((value) {
        if (value != null) {
          response = value;
          emit(GetPlayerAnalyticsSuccess());
        } else {
          emit(GetPlayerAnalyticsError());
        }
      });
    } catch (error) {
      emit(GetPlayerAnalyticsError());
    }
  }
}
