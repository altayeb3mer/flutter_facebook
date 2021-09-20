import 'package:flutter/material.dart';
import 'package:flutter_facebook/config/palette.dart';
import 'package:flutter_facebook/models/models.dart';
import 'package:flutter_facebook/widget/profile_avatar.dart';

class MessengerOnlineUser extends StatelessWidget {
  final List<User> onlineUsers;

  const MessengerOnlineUser({Key key, @required this.onlineUsers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 4.0),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + onlineUsers.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: OnlineList(
                    isFirst: true,
                  ));
            }
            final User user = onlineUsers[index - 1];

            return OnlineList(user: user);
          }),
    );
  }
}

class OnlineList extends StatelessWidget {
  final bool isFirst;
  final User user;

  const OnlineList({Key key, this.isFirst = false, this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 4.0),
      width: 70.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50.0,
            height: 50.0,
            decoration:
                BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
            child: isFirst
                ? Center(
                    child: ShaderMask(
                      shaderCallback: (rect) =>
                          Palette.createRoomGradient.createShader(rect),
                      child:
                          Icon(Icons.video_call, size: 30.0, color: Colors.black),
                    ),
                  )
                : ProfileAvatar(
                    imgUrl: user.imageUrl,
                    isActive: true,
                    isMessenger: true,
                  ),
          ),
          const SizedBox(height: 4.0),
          Container(
            child: Flexible(
              child: Text(
                isFirst ? 'Create\nRoom' : user.name,
                style: TextStyle(
                  fontSize: 14.0,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
