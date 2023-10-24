import 'package:flutter/cupertino.dart';

class DemoPage extends StatelessWidget {
  final String pageName;
  const DemoPage({Key? key, required this.pageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(pageName),
    );
  }
}
