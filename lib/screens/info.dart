import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook/config/palette.dart';
import 'package:flutter_facebook/widget/profile_avatar.dart';

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Padding(
                    //     padding: const EdgeInsets.all(20.0),
                    //     child: Container(
                    //       width: 50.0,
                    //       height: 50.0,
                    //       child: ProfileAvatar(
                    //         imgUrl: "https://i.ibb.co/YPXJCZX/profile-Img.jpg",
                    //         isMessenger: true,
                    //       ),
                    //     )),
                    CircleAvatar(
                        radius: 60.0,
                        backgroundColor: Colors.grey[200],
                        backgroundImage: CachedNetworkImageProvider("https://i.ibb.co/YPXJCZX/profile-Img.jpg")),
                  ],
                ),
                const SizedBox(height: 30.0),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  child: Text("Developer info ",
                      style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Name : ",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: Palette.facebookBlue),
                      ),
                      Text(
                        "Altayeb Almubarak",
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Email : ",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: Palette.facebookBlue),
                      ),
                      Text(
                        "altayeb3mer@gmail.com",
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Phone : ",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: Palette.facebookBlue),
                      ),
                      Text(
                        "+249116774943 - +249925510574",
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
