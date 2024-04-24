import 'package:flutter/material.dart';
import 'package:library_server/screen/library_books_screen.dart';
import 'package:library_server/screen/library_home_screen.dart';
import '../utils/colors/app_colors.dart';

class TabBox1 extends StatefulWidget {
  const TabBox1({super.key});

  @override
  State<TabBox1> createState() => _TabBox1State();
}

class _TabBox1State extends State<TabBox1> {
  List<Widget> _screens = [];
  int _activeIndex = 1;

  @override
  void initState() {
    _screens = [
      HomeScreen(),
      BooksScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_activeIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (newActiveIndex) {
          _activeIndex = newActiveIndex;
          setState(() {});
        },
        currentIndex: _activeIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 16,
        unselectedFontSize: 14,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white10,
        backgroundColor: Color(0xFF29BB89),
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home,
              color: AppColors.white,
              size: 30,
            ),
            icon: Icon(
              Icons.home,
              color: AppColors.white,
              size: 30,
            ),
            label: "Generate",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.menu_book_outlined,
              color: AppColors.white,
              size: 30,
            ),
            icon: Icon(
              Icons.menu_book_outlined,
              color: AppColors.white,
              size: 30,
            ),
            label: "History",
          ),
        ],
      ),
    );
  }
}
