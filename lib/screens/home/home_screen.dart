import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../states/bottom_nav_bar/notifier.dart';
import '../../widgets/responsive_layout_widget/responsive_layout_widget.dart';
import '../landing_page/LandingPage.dart';
import '../landing_page/widgets/landing_page_app_bar.dart';
import '../landing_page/widgets/side_drawer.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  static final List<Widget> _widgetOptions = <Widget>[
    const LandingPage(),
    Container(
      color: Colors.red,
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
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () async {
        //     // TODO
        //   },
        //   child: const Icon(Icons.note_add_outlined),
        // ),
        key: _scaffoldKey,

        appBar: navIndex == 0
            ? LandingPageAppBar(
                scaffoldKey: _scaffoldKey,
                preferredSize: const Size.fromHeight(60),
                child: Container(),
              )
            : null,
        // Side Drawer
        drawer: const SideDrawer(),
        extendBody: true,
        extendBodyBehindAppBar: true,

        // body
        body: _widgetOptions[navIndex],
        // Bottom Navigation Bar
        bottomNavigationBar: BottomNavigationBar(
          // backgroundColor: Colors.white,
          landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
          currentIndex: navIndex,
          onTap: (int index) {
            ref.read(navProvider.notifier).onIndexChanged(index);
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
