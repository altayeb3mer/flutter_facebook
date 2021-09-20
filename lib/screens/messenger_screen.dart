import 'package:flutter/material.dart';
import 'package:flutter_facebook/config/palette.dart';
import 'package:flutter_facebook/data/data.dart';
import 'package:flutter_facebook/models/models.dart';
import 'package:flutter_facebook/widget/widget.dart';

class MessengerScreen extends StatefulWidget {
  @override
  _MessengerScreenState createState() => _MessengerScreenState();
}

class _MessengerScreenState extends State<MessengerScreen> {
  final TrackingScrollController trackingScrollController = TrackingScrollController();
  @override
  void dispose() {
    // TODO: implement dispose
    trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(90.0),
        borderSide:  BorderSide.none,

    );
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: CustomScrollView(
            controller: trackingScrollController,
            physics: BouncingScrollPhysics(),
            slivers: [
              //appBar
              SliverAppBar(
                snap: false,
                automaticallyImplyLeading: false,
                brightness: Brightness.light,
                backgroundColor: Colors.white,
                title: Container(
                  child: Row(
                    children: [
                      CircleAvatar(child: ProfileAvatar(imgUrl: currentUser.imageUrl)),
                      const SizedBox(width: 4.0,),
                      Text(
                        'Chats',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -1.2),
                      ),
                    ],
                  ),
                ),
                centerTitle: false,
                floating: true,
                actions: [
                  CircleButton(Icons.camera_alt, 25.0, () {}),
                  CircleButton(Icons.edit, 25.0, () {}),

                ],
              ),
              //TextField search
              SliverToBoxAdapter(
                  child: Container(
                    height: 45.0,
                    margin: const EdgeInsets.all(10.0),
                    child:TextField(
                      maxLines: 1,
                      style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.w400),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                          focusedBorder: border,
                          border: border,
                          prefixIcon: Icon(
                            Icons.search_outlined,
                            color: Colors.black26,
                          ),
                          hintStyle: TextStyle(
                              color: Colors.black26,),
                          filled: true,
                          fillColor: Colors.grey[200],
                          hintText: 'Search'),
                    ),
                  ),
              ),
              //online users
              SliverToBoxAdapter(
                child: MessengerOnlineUser(onlineUsers:onlineUsers),
              ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              // final Post post = posts[index];
              final User user = onlineUsers[index];
              return ChatsList(user: user);
            }, childCount:onlineUsers.length)),
            ],
          ),
      ),
    );
  }
}
