import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../states/bottom_nav_bar/notifier.dart';
import '../../widgets/responsive_layout_widget/responsive_layout_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  static final List<Widget> _widgetOptions = <Widget>[
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.blue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final int navIndex = ref.watch(navProvider).index;
    return ResponsiveLayoutWidget(
      mobile: Scaffold(
        body: _widgetOptions[navIndex],
        // Bottom Navigation Bar
        bottomNavigationBar: BottomNavigationBar(
          landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
          currentIndex: navIndex,
          onTap: (int index) {
            print(index);
            ref.read(navProvider.notifier).onIndexChanged(index);
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.search_outlined), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.last_page_outlined), label: 'Final'),
          ],
        ),
      ),
    );
  }
}
