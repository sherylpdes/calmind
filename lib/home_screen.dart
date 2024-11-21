import 'package:flutter/material.dart';
import 'home_screen_content.dart';
import 'affirmation_screen.dart';
import 'relaxation_screen.dart';
import 'daily_screen.dart';
import 'emergency_screen.dart';
import 'profile_screen.dart';
import 'custom_bottom_navbar.dart';

class HomeScreen extends StatefulWidget {
  final String username;

  const HomeScreen({super.key, required this.username});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  late List<Widget> widgetList;

  @override
  void initState() {
    super.initState();
    widgetList = [
      HomeScreenContent(username: widget.username),
      const AffirmationScreen(),
      const RelaxationScreen(),
      const DailyScreen(),
      const EmergencyScreen(),
      const ProfileScreen(),
    ];
  }

  void _onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetList[currentIndex],
      bottomNavigationBar: CustomBottomNavbar(
        currentIndex: currentIndex,
        onTap: _onTap,
        widgetList: widgetList,
      ),
    );
  }
}
