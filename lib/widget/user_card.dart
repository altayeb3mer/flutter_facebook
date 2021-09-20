import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook/models/models.dart';
import 'package:flutter_facebook/widget/profile_avatar.dart';

class UserCard extends StatelessWidget {
  final User currentUser;

  const UserCard({Key key,@required this.currentUser}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileAvatar(imgUrl: currentUser.imageUrl),
          const SizedBox(width: 6.0),
          Flexible(
            child: Text(currentUser.name,style:const TextStyle(
              fontSize: 16.0
            ),
            overflow: TextOverflow.ellipsis,),
          )
        ],
      ),
    );
  }
}
