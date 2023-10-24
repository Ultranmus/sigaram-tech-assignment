import 'package:flutter/cupertino.dart';

class KeepAlivePage extends StatefulWidget {
  final Widget widget;
  const KeepAlivePage({Key? key, required this.widget}) : super(key: key);

  @override
  State<KeepAlivePage> createState() => _KeepAlivePageState();
}

class _KeepAlivePageState extends State<KeepAlivePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return widget.widget;
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
