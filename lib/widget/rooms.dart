import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook/config/palette.dart';
import 'package:flutter_facebook/models/models.dart';
import 'package:flutter_facebook/widget/profile_avatar.dart';
import 'package:flutter_facebook/widget/widget.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  Rooms(this.onlineUsers);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
          : null,
      child: Container(
        height: 60.0,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
            scrollDirection: Axis.horizontal,
            itemCount: 1 + onlineUsers.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: _CreateRoomButton());
              }
              final User user = onlineUsers[index - 1];


              return Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ProfileAvatar(imgUrl: user.imageUrl, isActive: true,),);
            }),
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () {},
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      color: Colors.white,
      borderSide: BorderSide(
        color: Colors.blueAccent[200],
        width: 3.0,
      ),
      textColor: Palette.facebookBlue,
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect) =>
                Palette.createRoomGradient.createShader(rect),
            child: Icon(
                Icons.video_call,
                size: 30.0,
                color: Colors.white
            ),
          ),
          SizedBox(width: 4.0),
          Text('Create\nRoom')
        ],
      ),
    );
  }
}
