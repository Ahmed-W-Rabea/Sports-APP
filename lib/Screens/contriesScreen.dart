import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubits/cubit/get_country_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'HomeScreen.dart';
import 'LeaguesScreen.dart';

class CountriesScreen extends StatelessWidget {
  const CountriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30.h, left: 10.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => HomeScreen(),
                        ),
                        (route) => false,
                      );
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                    color: const Color.fromARGB(255, 237, 179, 97),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                      height: 160.h,
                      width: 160.w,
                      child: Image.asset('assets/images/logo2.png')),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h, bottom: 10),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: GradientText(
                    'COUNTRIES',
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontFamily: 'MxRegular',
                        color: Colors.white),
                    colors: const [
                      Color.fromARGB(255, 221, 156, 64),
                      Color.fromARGB(255, 254, 217, 164),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25.h, bottom: 15.h),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    '- select the country -',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: 'RaceSport',
                        color: Colors.white),
                  ),
                ),
              ),
              BlocBuilder<GetCountryCubit, GetCountryState>(
                builder: (context, state) {
                  if (state is GetCountryLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is GetCountrySuccess) {
                    return Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: SizedBox(
                        height: 352.h,
                        child: Expanded(
                          child: GridView.count(
                            crossAxisCount: 3,
                            childAspectRatio: 5 / 4,
                            crossAxisSpacing: 17,
                            mainAxisSpacing: 17,
                            children: [
                              for (int i = 0;
                                  i < state.response.result!.length;
                                  i++)
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            const LeaguesScreen(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      gradient: LinearGradient(
                                        colors: [
                                          Color.fromARGB(255, 221, 156, 64),
                                          Color.fromARGB(255, 254, 217, 164),
                                        ],
                                      ),
                                    ),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 50.h,
                                            width: 50.w,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  state.response.result?[i]
                                                          .countryLogo ??
                                                      'https://media.istockphoto.com/id/1264074047/vector/breaking-news-background.jpg?s=612x612&w=0&k=20&c=C5BryvaM-X1IiQtdyswR3HskyIZCqvNRojrCRLoTN0Q=',
                                                ),
                                                fit: BoxFit.fitWidth,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            state.response.result?[i]
                                                    .countryName ??
                                                'null name',
                                            style: TextStyle(
                                                shadows: const [
                                                  Shadow(
                                                    color: Colors.black,
                                                    offset: Offset(1.0, 1.0),
                                                  ),
                                                ],
                                                fontSize: 8.sp,
                                                fontFamily: 'RaceSport',
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const Center(
                      child: Text("Somethinge went wrone"),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
