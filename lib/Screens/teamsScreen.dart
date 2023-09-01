import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/taps_of_teamsScreen/teams.dart';
import 'package:flutter_application_1/Screens/taps_of_teamsScreen/top_Scorers.dart';

class TeamsScreen extends StatefulWidget {
  TeamsScreen({super.key});

  @override
  State<TeamsScreen> createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          automaticallyImplyLeading: false,
          title: TabBar(
              controller: _tabController,
              indicatorColor: const Color.fromARGB(255, 221, 156, 64),
              tabs: const [
                Tab(text: 'Teams', icon: Icon(Icons.groups_3)),
                Tab(text: 'Top Scorers', icon: Icon(Icons.stars)),
              ]),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromARGB(255, 27, 25, 25),
                  Color.fromARGB(255, 32, 33, 43),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            Teams(),
            TopScorers(),
          ],
        ),
      ),
    );
  }
}
