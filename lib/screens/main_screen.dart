import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_some/screens/home_screen.dart';
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  final List<Tab> tabs = <Tab>[
    Tab(text: 'General',),
    Tab(text: 'Technology',),
    Tab(text: 'Sports',),
    Tab(text: 'Business',),
    Tab(text: 'Entertainment',),
    Tab(text: 'Health',),
  ];

  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: tabs.length,
        vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('NewsApi',),
          bottom: TabBar(
            isScrollable: true,
            unselectedLabelColor: Colors.white,
            labelColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BubbleTabIndicator(
                indicatorHeight: 25.0,
                indicatorColor: Colors.black54,
                tabBarIndicatorSize: TabBarIndicatorSize.tab
            ),
            tabs: tabs,
            controller: _tabController,
          ),
        ),
        body: HomeScreen(_tabController, tabs)
    );
  }
}
