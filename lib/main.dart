import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Data/APIModels/fireBaseAPI.dart';
import 'package:flutter_application_1/Screens/Splash_Screen.dart';
import 'package:flutter_application_1/cubits/get_news/get_news_cubit.dart';
import 'package:flutter_application_1/Screens/LoginScreen.dart';
import 'package:flutter_application_1/Screens/Splash_Screen.dart';

import 'package:flutter_application_1/resources/auth.dart';
import 'package:flutter_application_1/share/local/cache/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cubits/get_player/get_player_cubit.dart';
import 'cubits/get_playerAnalytics/get_player_analytics_cubit.dart';
import 'cubits/get_team/get_team_cubit.dart';
import 'cubits/get_country/get_country_cubit.dart';
import 'cubits/get_league/get_league_cubit.dart';
import 'cubits/get_topScorers/get_top_scorers_cubit.dart';
import 'firebase_options.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotification();
  await CacheHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetCountryCubit>(
          create: (BuildContext context) => GetCountryCubit()..getCountry(),
        ),
        BlocProvider<GetLeagueCubit>(
          create: (BuildContext context) => GetLeagueCubit()..getLeague(),
        ),
        BlocProvider<GetTeamCubit>(
          create: (BuildContext context) => GetTeamCubit(),
        ),
        BlocProvider<GetTopScorersCubit>(
          create: (BuildContext context) => GetTopScorersCubit(),
        ),
        BlocProvider<GetPlayerCubit>(
          create: (BuildContext context) => GetPlayerCubit(),
        ),
        BlocProvider<GetPlayerAnalyticsCubit>(
          create: (BuildContext context) => GetPlayerAnalyticsCubit(),
        ),
        BlocProvider<GetNewsCubit>(
          create: (BuildContext context) => GetNewsCubit()..getNews(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ),
      ),
    );
  }
}
