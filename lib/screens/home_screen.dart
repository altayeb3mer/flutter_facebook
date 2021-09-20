import 'package:flutter/material.dart';
import 'package:flutter_facebook/config/palette.dart';
import 'package:flutter_facebook/data/data.dart';
import 'package:flutter_facebook/models/models.dart';
import 'package:flutter_facebook/screens/messenger_nav_screen.dart';
import 'package:flutter_facebook/screens/screens.dart';
import 'package:flutter_facebook/widget/circle_button.dart';
import 'package:flutter_facebook/widget/widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TrackingScrollController _trackingScrollController = TrackingScrollController();

  @override
  void dispose() {
    // TODO: implement dispose
    _trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _HomeScreenMobile(trackingScrollController:_trackingScrollController),
          desktop: _HomeScreenDesktop(trackingScrollController:_trackingScrollController),
        ),
      ),
    );
  }
}

class _HomeScreenMobile extends StatelessWidget {
  final TrackingScrollController trackingScrollController;

  const _HomeScreenMobile({Key key,@required this.trackingScrollController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        controller: trackingScrollController,
        physics: BouncingScrollPhysics(), slivers: [
      SliverAppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        title: Text(
          'Facebook',
          style: TextStyle(
              color: Palette.facebookBlue,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2),
        ),
        centerTitle: false,
        floating: true,
        actions: [
          CircleButton(Icons.search, 30.0, () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => TestNav()),
            // );
          }),
          CircleButton(MdiIcons.facebookMessenger, 30.0, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MessengerNavScreen()),
            );
          }),
        ],
      ),
      SliverToBoxAdapter(
        child: CreatePostContainer(currentUser),
      ),
      SliverPadding(
        padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
        sliver: SliverToBoxAdapter(
          child: Rooms(onlineUsers),
        ),
      ),
      SliverPadding(
        padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
        sliver: SliverToBoxAdapter(
          child: Stories(currentUser: currentUser, stories: stories),
        ),
      ),
      SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        final Post post = posts[index];
        return PostContainer(post: post);
      }, childCount: posts.length)),
    ]);
  }
}

class _HomeScreenDesktop extends StatelessWidget {
  final TrackingScrollController trackingScrollController;

  const _HomeScreenDesktop({Key key,@required this.trackingScrollController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: MoreOptionsList(currentUser:currentUser),
            ),
          ),
        ),
        const Spacer(),
        Container(
          width: 600.0,
          child: CustomScrollView(
              controller: trackingScrollController,physics: BouncingScrollPhysics(), slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
              sliver: SliverToBoxAdapter(
                child: Stories(currentUser: currentUser, stories: stories),
              ),
            ),
            SliverToBoxAdapter(
              child: CreatePostContainer(currentUser),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
              sliver: SliverToBoxAdapter(
                child: Rooms(onlineUsers),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              final Post post = posts[index];
              return PostContainer(post: post);
            }, childCount: posts.length)),
          ]),
        ),
        const Spacer(),
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ContactsList(users:onlineUsers),
            ),
          ),
        )
      ],
    );
  }
}
