import 'package:flutter/material.dart';
import '../models/page_model.dart';
import 'keep_alive_page.dart';

class BottomPageNavigation extends StatefulWidget {
  final List<PageModel> pages;
  const BottomPageNavigation({Key? key, required this.pages}) : super(key: key);

  @override
  State<BottomPageNavigation> createState() => _BottomPageNavigationState();
}

class _BottomPageNavigationState extends State<BottomPageNavigation> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTabTapped(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: widget.pages
            .map((page) => KeepAlivePage(widget: page.pageWidget))
            .toList(),
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.orangeAccent,
          unselectedItemColor: Colors.white,
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          items: widget.pages
              .map((page) => BottomNavigationBarItem(
                  icon: Icon(page.icon), label: page.pageName))
              .toList()),
    );
  }
}
