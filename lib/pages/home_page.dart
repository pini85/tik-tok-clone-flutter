import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';
import 'package:tiktokclone/constant/data_json.dart';
import 'package:tiktokclone/widgets/header_home_page.dart';
import 'package:tiktokclone/widgets/left_panel.dart';
import 'package:tiktokclone/widgets/right_panel.dart';
import 'package:tiktokclone/widgets/video_item.dart';
import "../theme/colors.dart";

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: items.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return RotatedBox(
      quarterTurns: 1,
      child: TabBarView(
        controller: _tabController,
        children: List.generate(
          items.length,
          (index) {
            return RotatedBox(
              quarterTurns: 3,
              child: VideoPlayerItem(
                  size: size,
                  name: items[index]["name"],
                  caption: items[index]["caption"],
                  songName: items[index]["songName"],
                  profileImg: items[index]["profileImg"],
                  likes: items[index]["likes"],
                  comments: items[index]["comments"],
                  shares: items[index]["shares"],
                  albumImg: items[index]["albumImg"],
                  videoUrl: items[index]["videoUrl"]),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return getBody();
  }
}

class VideoPlayerItem extends StatefulWidget {
  final dynamic size;
  final String videoUrl;
  final String name;
  final String caption;
  final String songName;
  final String profileImg;
  final String likes;
  final String comments;
  final String shares;
  final String albumImg;
  const VideoPlayerItem(
      {Key? key,
      required this.size,
      required this.videoUrl,
      required this.name,
      required this.caption,
      required this.songName,
      required this.profileImg,
      required this.likes,
      required this.comments,
      required this.shares,
      required this.albumImg})
      : super(key: key);

  @override
  State<VideoPlayerItem> createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem>
    with SingleTickerProviderStateMixin {
  late VideoPlayerController _videoPlayerController;
  var _isShowPlaying = false;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((value) {
        _videoPlayerController.play();
        setState(() {
          _isShowPlaying = false;
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _videoPlayerController.value.isPlaying
              ? _videoPlayerController.pause()
              : _videoPlayerController.play();
        });
      },
      child: Container(
        width: widget.size.width,
        height: widget.size.height,
        child: Stack(
          children: <Widget>[
            Container(
                width: widget.size.width,
                height: widget.size.height,
                child: Stack(
                  children: <Widget>[
                    VideoPlayer(_videoPlayerController),
                    _videoPlayerController.value.isPlaying
                        ? Container()
                        : Center(
                            child: Icon(
                              Icons.play_arrow,
                              size: 80,
                              color: white.withOpacity(0.5),
                            ),
                          ),
                  ],
                )),
            Container(
              width: widget.size.width,
              height: widget.size.height,
              child: SafeArea(
                child: Container(
                  width: widget.size.width,
                  height: widget.size.height,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 25, right: 15, left: 15, bottom: 10),
                    child: Column(
                      children: <Widget>[
                        HeaderHomePage(),
                        Flexible(
                          child: RotatedBox(
                            quarterTurns: 4,
                            child: Row(
                              children: <Widget>[
                                LeftPanel(
                                    name: widget.name,
                                    caption: widget.caption,
                                    songName: widget.songName),
                                RightPanel(
                                  profileImg: widget.profileImg,
                                  likes: widget.likes,
                                  comments: widget.comments,
                                  shares: widget.shares,
                                  albumImg: widget.albumImg,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
