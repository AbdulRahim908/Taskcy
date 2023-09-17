import 'package:flutter/material.dart';
import 'package:hackathon/screens/home.dart';
import 'package:hackathon/screens/homeview2.dart';
import 'package:hackathon/screens/homeview3.dart';

class PageViewDemo extends StatefulWidget {
  const PageViewDemo({super.key});
  @override
  State<PageViewDemo> createState() => _PageViewDemoState();
}
class _PageViewDemoState extends State<PageViewDemo> {
  final _controller = PageController(
    initialPage: 0,
  );
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children: const [
        HomeView1(),
        HomeView2(),
        HomeView3(),
      ],
    );
  }
}