import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook/config/palette.dart';

class ProfileAvatar extends StatelessWidget {
  final String imgUrl;
  final bool isActive;
  final bool hasBorder;
  final bool isMessenger;

  const ProfileAvatar(
      {Key key,
      @required this.imgUrl,
      this.isActive = false,
      this.hasBorder = false,
      this.isMessenger = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
           CircleAvatar(
            radius:isMessenger ? 50 : 20 ,
            backgroundColor: Palette.facebookBlue,
            child: CircleAvatar(
                radius: hasBorder ? 17.0 : isMessenger ? 50 : 20.0,
                backgroundColor: Colors.grey[200],
                backgroundImage: CachedNetworkImageProvider(imgUrl)),
          ),
        isActive
            ? Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Container(
                  height: 15.0,
                  width: 15.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Palette.online,
                      border: Border.all(width: 2.0, color: Colors.white)),
                ))
            : const SizedBox.shrink(),
      ],
    );
  }
}
