import 'package:flutter/material.dart';
import 'package:sports_complete/features/data/pages/data_page.dart';
import 'package:sports_complete/features/live_games/pages/live_games_page.dart';
import 'package:sports_complete/features/settings/pages/setttings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(_currentIndex);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.living_outlined),
            activeIcon: Icon(Icons.living),
            label: '直播',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.data_usage_outlined),
            activeIcon: Icon(Icons.data_usage),
            label: '数据',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: '我的',
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          LiveGamesPage(),
          DataPage(),
          SettingsPage(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
