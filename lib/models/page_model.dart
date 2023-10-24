import 'package:flutter/cupertino.dart';

class PageModel {
  final IconData icon;
  final String pageName;
  final Widget pageWidget;
  PageModel(
      {required this.icon, required this.pageName, required this.pageWidget});
}
