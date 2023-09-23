import 'package:flutter/material.dart';
import 'package:taxido/mainpages/earningscreen.dart';
import 'package:taxido/mainpages/homescreen.dart';
import 'package:taxido/mainpages/profilescreen.dart';
import 'package:taxido/mainpages/ratingscreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  int selectedIndex = 0;

  onPageChanged(int index) {
    setState(() {
      selectedIndex = index;
      controller!.index = selectedIndex;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onPageChanged,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey.shade800,
        backgroundColor: Colors.red,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.credit_card), label: "Earning"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "rating"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "profile"),
        ],
      ),
      body: TabBarView(
        controller: controller,
        physics: NeverScrollableScrollPhysics(),
        children: [
          HometabScreen(),
          EarningsTabScreen(),
          RatingtabScreen(),
          ProfiletabScreen()
        ],
      ),
    );
  }
}
