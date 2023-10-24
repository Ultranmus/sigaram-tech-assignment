import 'package:flutter/material.dart';
import '../models/page_model.dart';
import '../pages/demo_page.dart';
import '../pages/home_page.dart';
import '../pages/setting_page.dart';

Map<String, PageModel> pageWidgetsMap = {
  'Settings': PageModel(
      icon: Icons.settings,
      pageName: 'Settings',
      pageWidget: const SettingPage()),
  'Categories': PageModel(
      icon: Icons.category,
      pageName: 'Categories',
      pageWidget: const DemoPage(
        pageName: 'Categories',
      )),

  'Home': PageModel(
      icon: Icons.home, pageName: 'Home', pageWidget: const HomePage()),
  'Discover': PageModel(
      icon: Icons.manage_search,
      pageName: 'Discover',
      pageWidget: const DemoPage(
        pageName: 'Discover',
      )),
  'Profile': PageModel(
      icon: Icons.person_pin_circle,
      pageName: 'Profile',
      pageWidget: const DemoPage(
        pageName: 'Profile',
      )),
  'Not Found': PageModel(
      icon: Icons.close,
      pageName: 'Not Found',
      pageWidget: const DemoPage(
        pageName: 'Not Found',
      )),
  // Add more entries as needed
};
