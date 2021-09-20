import 'package:flutter/material.dart';
import 'package:flutter_facebook/config/palette.dart';

class CustomTabBarMessenger extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function onTap;
  final bool isBottomIndicator;

  const CustomTabBarMessenger(
      {Key key,
        @required this.icons,
        @required this.selectedIndex,
        @required this.onTap,
        this.isBottomIndicator = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: TabBar(
        indicatorPadding: EdgeInsets.zero,
        indicator: BoxDecoration(
            // border: isBottomIndicator
            //     ? Border(
            //     bottom: BorderSide(color: Palette.facebookBlue, width: 3.0))
            //     : Border(
            //     top: BorderSide(color: Palette.facebookBlue, width: 3.0)),
          boxShadow: [
            // BoxShadow(
            //   // color: Colors.black26,
            //   // blurRadius: 25,
            //   offset: Offset(0, 2), // changes position of shadow
            // ),
          ],),
        tabs: icons
            .asMap()
            .map((i, e) => MapEntry(
            i,
            Tab(
              icon: Icon(
                e,
                color: i == selectedIndex
                    ? Colors.black87
                    : Colors.black45,
                size: i == selectedIndex ? 30.0 : 25.0,
              ),
            )))
            .values
            .toList(),
        onTap: onTap,
      ),
    );
  }
}
