import 'package:flutter/material.dart';
import 'package:flutter_facebook/screens/info.dart';
import 'package:flutter_facebook/screens/messenger_screen.dart';
import 'package:flutter_facebook/widget/custom_tab_bar_messenger.dart';
import 'package:flutter_facebook/widget/widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class MessengerNavScreen extends StatefulWidget {
  @override
  _MessengerNavScreenState createState() => _MessengerNavScreenState();
}

class _MessengerNavScreenState extends State<MessengerNavScreen> {

  final List<Widget> _screens = [
    MessengerScreen(),
    Info(),
  ];
  final List<IconData> _icons = [
    MdiIcons.chat,
    MdiIcons.accountMultiple,
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _screens.length,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: IndexedStack(index: _selectedIndex, children: _screens),
            bottomNavigationBar:!Responsive.isDesktop(context)
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 1.0),
                    child: CustomTabBarMessenger(
                        icons: _icons,
                        selectedIndex: _selectedIndex,
                        onTap: (index) => setState(() => _selectedIndex = index)),
                  ): const SizedBox.shrink(),
        ));
  }
}
