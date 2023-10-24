import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../firebase.dart';
import '../maps/page_widget_map.dart';
import '../models/page_model.dart';
import '../widgets/bottom_page_navigation.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  List<PageModel> pageWidgets(List<String> widgetNameList) {
    List<PageModel> listOfWidgets = [];
    for (String name in widgetNameList) {
      if (pageWidgetsMap.containsKey(name)) {
        listOfWidgets.add(pageWidgetsMap[name]!);
      } else {
        listOfWidgets.add(pageWidgetsMap['Not Found']!);
      }
    }
    return listOfWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<String>>(
          future: ref.read(firebaseProvider).fetchBottomTaryDocument(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No pages available.'));
            } else {
              final pagesData = snapshot.data!;
              return BottomPageNavigation(pages: pageWidgets(pagesData));
            }
          }),
    );
  }
}
