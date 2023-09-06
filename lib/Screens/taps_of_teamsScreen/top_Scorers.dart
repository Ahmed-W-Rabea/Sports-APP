import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../cubits/get_topScorers/get_top_scorers_cubit.dart';

class TopScorers extends StatelessWidget {
  const TopScorers({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<GetTopScorersCubit>(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 27, 25, 25),
              Color.fromARGB(255, 32, 33, 43),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.h, left: 30.w, right: 30.w),
              child: Align(
                alignment: Alignment.topCenter,
                child: Row(children: [
                  Text(
                    '#',
                    style: TextStyle(
                        fontSize: 9.sp,
                        fontFamily: 'RaceSport',
                        color: Colors.white),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Text(
                    'Name',
                    style: TextStyle(
                        fontSize: 9.sp,
                        fontFamily: 'RaceSport',
                        color: Colors.white),
                  ),
                  const Spacer(
                    flex: 6,
                  ),
                  Text(
                    'G',
                    style: TextStyle(
                        fontSize: 9.sp,
                        fontFamily: 'RaceSport',
                        color: Colors.white),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Text(
                    'GFP',
                    style: TextStyle(
                        fontSize: 9.sp,
                        fontFamily: 'RaceSport',
                        color: Colors.white),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Text(
                    'A',
                    style: TextStyle(
                        fontSize: 9.sp,
                        fontFamily: 'RaceSport',
                        color: Colors.white),
                  ),
                ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.h, right: 20.w, left: 20.w),
              child: SizedBox(
                height: 674,
                child: Expanded(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: SingleChildScrollView(
                        child: Column(
                      children: [
                        for (int i = 0; i < 15; i++) ...[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Container(
                              height: 45.h,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 225, 154, 55),
                                    Color.fromARGB(255, 207, 156, 84),
                                  ],
                                ),
                              ),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${i + 1} -',
                                      style: TextStyle(
                                          shadows: const [
                                            Shadow(
                                              color: Colors.black,
                                              offset: Offset(1.0, 1.0),
                                            ),
                                          ],
                                          fontSize: 9.sp,
                                          fontFamily: 'RaceSport'),
                                    ),
                                    const Spacer(
                                      flex: 3,
                                    ),
                                    SizedBox(
                                      width: 150.w,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            cubit.response.result?[i]
                                                    .playerName ??
                                                'null name',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                shadows: const [
                                                  Shadow(
                                                    color: Colors.black,
                                                    offset: Offset(1.0, 1.0),
                                                  ),
                                                ],
                                                fontSize: 9.sp,
                                                fontFamily: 'RaceSport'),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            child: Text(
                                              cubit.response.result?[i]
                                                      .teamName ??
                                                  'null name',
                                              style: TextStyle(
                                                  shadows: const [
                                                    Shadow(
                                                      color: Colors.black,
                                                      offset: Offset(1.0, 1.0),
                                                    ),
                                                  ],
                                                  fontSize: 7.sp,
                                                  fontFamily: 'RaceSport'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Spacer(
                                      flex: 5,
                                    ),
                                    Text(
                                      '${cubit.response.result?[i].goals ?? '-'}',
                                      style: TextStyle(
                                          shadows: const [
                                            Shadow(
                                              color: Colors.black,
                                              offset: Offset(1.0, 1.0),
                                            ),
                                          ],
                                          fontSize: 9.sp,
                                          fontFamily: 'RaceSport'),
                                    ),
                                    const Spacer(
                                      flex: 6,
                                    ),
                                    Text(
                                      '${cubit.response.result?[i].penaltyGoals ?? '-'}',
                                      style: TextStyle(
                                          shadows: const [
                                            Shadow(
                                              color: Colors.black,
                                              offset: Offset(1.0, 1.0),
                                            ),
                                          ],
                                          fontSize: 9.sp,
                                          fontFamily: 'RaceSport'),
                                    ),
                                    const Spacer(
                                      flex: 6,
                                    ),
                                    Text(
                                      '${cubit.response.result?[i].assists ?? '-'}',
                                      style: TextStyle(
                                          shadows: const [
                                            Shadow(
                                              color: Colors.black,
                                              offset: Offset(1.0, 1.0),
                                            ),
                                          ],
                                          fontSize: 9.sp,
                                          fontFamily: 'RaceSport'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ]
                      ],
                    )),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
