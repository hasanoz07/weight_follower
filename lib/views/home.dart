import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kilo_takipcisi/views/add_record.dart';
import 'package:kilo_takipcisi/views/graph_view.dart';
import 'package:kilo_takipcisi/views/history.dart';




class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPage(_currentTab),
      //body:GraphScreen(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(()=>AddRecord());
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.black,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        height: Get.height / 12,
        iconSize: 30,
        backgroundColor: Colors.black,
        activeColor: Colors.white,
        inactiveColor: Colors.grey,
        icons: [
          Icons.show_chart,
          Icons.history,
        ],
        activeIndex: _currentTab,
        onTap: (int) {
          setState(() {
            _currentTab = int;
           
          });
        },
        gapLocation: GapLocation.center,
      ),
    );
  }
}

Widget currentPage(int _currentTab) {
  if (_currentTab == 0) {
return GraphScreen();
  }else{
return HistoryScreen();
  }
}
