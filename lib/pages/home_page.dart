import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/my_current_location.dart';
import 'package:flutter_application_1/components/my_description_box.dart';
import 'package:flutter_application_1/components/my_drawer.dart';
import 'package:flutter_application_1/components/my_silver_app_bar.dart';
import 'package:flutter_application_1/components/my_tab_bar.dart';
import 'package:flutter_application_1/models/food.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySilverAppBar(
            title: MyTabBar(
              tabController: _tabController,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const MyCurrentLocation(),
                const MyDescriptionBox(),
              ],
            ),
          ),
        ],
        body: TabBarView(
          controller: _tabController,
          children: [
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => Text("first tab items"),
            ),
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => Text("second tab items"),
            ),
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => Text("third tab items"),
            ),
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => Text("third tab items"),
            ),
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => Text("third tab items"),
            ),
          ],
        ),
      ),
    );
  }
}
