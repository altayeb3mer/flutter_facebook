import 'package:flutter/material.dart';
import 'package:flutter_facebook/config/palette.dart';
import 'package:flutter_facebook/models/models.dart';
import 'package:flutter_facebook/widget/circle_button.dart';
import 'package:flutter_facebook/widget/custom_tab_bar.dart';
import 'package:flutter_facebook/widget/widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomAppBar extends StatelessWidget {
  final User currentUser;
  final List<IconData> icons;
  final int selectedIndex;
  final Function onTap;

  const CustomAppBar(
      {Key key,
      @required this.currentUser,
      @required this.icons,
      @required this.selectedIndex,
      @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.0,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const[
          BoxShadow(color: Colors.black12,offset: Offset(0,2),blurRadius: 4.0)
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text('Facebook', style: TextStyle(
            color: Palette.facebookBlue,
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            letterSpacing: -1.2),),
          ),


          Container(
            height: double.infinity,
            width: 600.0,
            child: CustomTabBar(icons: icons, selectedIndex: selectedIndex, onTap: onTap,isBottomIndicator : true),
          ),

          Expanded(child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              UserCard(currentUser : currentUser),
              CircleButton(Icons.search, 30.0, (){}),
              CircleButton(MdiIcons.facebookMessenger, 30.0, (){}),
            ],
          ))

        ],
      ),
    );
  }
}


