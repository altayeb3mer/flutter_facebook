import 'package:flutter/material.dart';
import 'package:flutter_facebook/data/data.dart';
import 'package:flutter_facebook/screens/info.dart';
import 'package:flutter_facebook/widget/responsive.dart';
import 'package:flutter_facebook/widget/widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'screens.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Info()
  ];
  final List<IconData> _icons = [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu,
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
        length: _icons.length,
        child: Scaffold(
          appBar: Responsive.isDesktop(context)
              ? PreferredSize(
                  child: CustomAppBar(
                    currentUser : currentUser,
                    icons : _icons,
                    selectedIndex : _selectedIndex,
                      onTap: (index) => setState(() => _selectedIndex = index)
          ),
                  preferredSize: Size(screenSize.width, 100.0))
              : null,
          body: IndexedStack(index: _selectedIndex, children: _screens),
          bottomNavigationBar: !Responsive.isDesktop(context)
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 1.0),
                  child: CustomTabBar(
                      icons: _icons,
                      selectedIndex: _selectedIndex,
                      onTap: (index) => setState(() => _selectedIndex = index)),
                )
              : const SizedBox.shrink(),
        ));
  }
}
