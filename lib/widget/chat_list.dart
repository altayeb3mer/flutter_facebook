import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook/models/models.dart';
import 'package:flutter_facebook/widget/widget.dart';

class ChatsList extends StatelessWidget {
  final Post post;
  final User user;

  const ChatsList({Key key, this.post, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Row(
        children: [
          Container(
            width: 50.0,
            height: 50.0,
            decoration:
                BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
            child: ProfileAvatar(
              imgUrl: user.imageUrl,
              isActive: true,
              isMessenger: true,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    'Hello' +
                        "jhdfdfjgnsdljfgnsjfgndslfjgndfjlfglhjdlkfghjdkfghjdfkghndgkhndfgk;hgf",
                    style: TextStyle(fontSize: 14.0),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ),
          // ProfileAvatar(imgUrl: user.imageUrl),
          CircleAvatar(
            radius: 8.0,
            backgroundColor: Colors.grey[200],
              backgroundImage: CachedNetworkImageProvider(user.imageUrl)
          )
          // CircleAvatar(
          //     radius: hasBorder ? 17.0 : isMessenger ? 50 : 20.0,
          //     backgroundColor: Colors.grey[200],
          //     backgroundImage: CachedNetworkImageProvider(imgUrl))
        ],
      ),
    );
  }
}
