import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubits/get_news/get_news_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../used widgets/widgets.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  static const route = '/notification-screen';

  List catigoryName = ['Football', 'BasketBall', 'Cricket', 'Tennis'];
  List catigoryPhotoUrl = [
    'assets/images/foot_ball.jpg',
    'assets/images/BasketBall.jpg',
    'assets/images/Cricket.jpg',
    'assets/images/Tennis.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: GradientAppBar(
        automaticallyImplyLeading: false,
        gradient: const LinearGradient(colors: [
          Color.fromARGB(255, 23, 22, 22),
          Color.fromARGB(255, 28, 28, 35),
        ]),
        elevation: 5,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
          color: const Color.fromARGB(255, 234, 174, 90),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 38, top: 4),
          child: Row(
            children: [
              Center(
                child: GradientText(
                  'SPORTS APP',
                  style: TextStyle(
                    fontFamily: 'MxRegular',
                    fontSize: 23.sp,
                  ),
                  colors: const [
                    Color.fromARGB(255, 221, 156, 64),
                    Color.fromARGB(255, 254, 217, 164),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: SizedBox(
                  height: 45,
                  width: 45,
                  child: Image.asset(
                    'assets/images/logo.png',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(top: 35.h),
              child: Text(
                '- Hot Updates -',
                style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: 'RaceSport',
                    color: Colors.white),
              ),
            ),
            BlocBuilder<GetNewsCubit, GetNewsState>(builder: (context, state) {
              if (state is GetNewsLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GetNewsSuccess) {
                return Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: CarouselSlider.builder(
                      itemCount: state.response.articles.length,
                      itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                          Container(
                            height: 220.h,
                            width: 270.w,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                      state.response.articles[itemIndex]
                                              .urlToImage ??
                                          'https://media.istockphoto.com/id/1264074047/vector/breaking-news-background.jpg?s=612x612&w=0&k=20&c=C5BryvaM-X1IiQtdyswR3HskyIZCqvNRojrCRLoTN0Q=',
                                    ),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white),
                            child: Padding(
                              padding: EdgeInsets.only(top: 45.h, left: 15.w),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GradientText(
                                    state.response.articles[itemIndex].title,
                                    style: TextStyle(
                                      shadows: const [
                                        Shadow(
                                          color: Colors.black,
                                          offset: Offset(2.5, 1.5),
                                        ),
                                      ],
                                      color: Colors.white,
                                      fontSize: 15.sp,
                                      fontFamily: 'RaceSport',
                                    ),
                                    colors: const [
                                      Color.fromARGB(255, 221, 156, 64),
                                      Color.fromARGB(255, 254, 217, 164),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                      options: CarouselOptions(
                        height: 220,
                        viewportFraction: 0.75,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        scrollDirection: Axis.horizontal,
                      )),
                );
              } else {
                return const Center(
                  child: Text('No Result'),
                );
              }
            }),
            Padding(
              padding: EdgeInsets.only(top: 28.h),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  '- Catigories -',
                  style: TextStyle(
                      fontSize: 13.sp,
                      fontFamily: 'RaceSport',
                      color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
              child: SizedBox(
                height: 283.h,
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: [
                    for (int i = 0; i < 4; i++)
                      container(
                        name: catigoryName[i],
                        image: catigoryPhotoUrl[i],
                        onPresed: () {
                          showdialog(i, context);
                        },
                      ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
