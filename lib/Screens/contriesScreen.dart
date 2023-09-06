import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubits/cubit/get_country_cubit.dart';
import 'package:flutter_application_1/used%20widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'HomeScreen.dart';
import 'LeaguesScreen.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class CountriesScreen extends StatefulWidget {
  CountriesScreen({super.key});

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  String? _currentAddress;
  Position? _currentPosition;
  String? _userCountry;
  ScrollController _scrollController = ScrollController();

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context as BuildContext).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context as BuildContext).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context as BuildContext).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
      _currentPosition!.latitude,
      _currentPosition!.longitude,
      localeIdentifier: "en_US",
    ).then((List<Placemark> placemarks) {
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        setState(() {
          _currentAddress =
              '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}, ${place.country}';
          _userCountry = place.country; // Get the user's country
        });
      } else {
        setState(() {
          _currentAddress = "Address not found";
        });
      }
    }).catchError((e) {
      debugPrint(e);
    });
  }

  @override
  void initState() {
    super.initState();
    _getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context),
      appBar: GradientAppBar(
        gradient: const LinearGradient(colors: [
          Color.fromARGB(255, 23, 22, 22),
          Color.fromARGB(255, 28, 28, 35),
        ]),
        elevation: 5,
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 221, 156, 64),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.location_on),
            onPressed: _getCurrentPosition,
          ),
        ],
        title: Padding(
          padding: const EdgeInsets.only(left: 38, top: 4),
        ),
      ),
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
                padding: EdgeInsets.only(top: 15.h),
                child: Text(
                  ' ${_currentAddress ?? ""}',
                  style: TextStyle(
                    color: Color.fromARGB(255, 221, 156, 64),
                    fontSize: 12.sp,
                    fontFamily: 'RaceSport',
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
                    int userCountryIndex = state.response.result!.indexWhere(
                        (country) => country.countryName == _userCountry);
                    if (userCountryIndex >= 0) {
                      WidgetsBinding.instance!.addPostFrameCallback((_) {
                        _scrollController.animateTo(
                          (userCountryIndex / 3.65).floor() *
                              (MediaQuery.of(context).size.width / 3.65),
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.easeInOut,
                        );
                      });
                    }

                    return Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: SizedBox(
                        height: 352.h,
                        child: Expanded(
                          child: GridView.count(
                            controller: _scrollController,
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
                                    decoration: BoxDecoration(
                                      border: _userCountry ==
                                              state.response.result?[i]
                                                  .countryName
                                          ? Border.all(
                                              color: Colors.green, width: 4.0)
                                          : null,
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
                                              color: Colors.white,
                                            ),
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

                    /* return Padding(
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
                                    decoration: BoxDecoration(
                                      border: _userCountry ==
                                              state.response.result?[i]
                                                  .countryName
                                          ? Border.all(
                                              color: Colors.green, width: 2.0)
                                          : null,
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
                    );*/
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
