// import 'package:flutter/material.dart';
// import 'package:tiktok/constant/data_json.dart';
// import 'package:tiktok/widgets/right_panel.dart';
// import 'package:video_player/video_player.dart';

// import 'left_panel.dart';

// class VideoItem extends StatefulWidget {
//   final String videoUrl;
//   final String name;
//   final String caption;
//   final String songName;
//   final String profileImg;
//   final String likes;
//   final String comments;
//   final String shares;
//   final String albumImg;

//   const VideoItem(
//       {Key? key,
//       required this.videoUrl,
//       required this.name,
//       required this.caption,
//       required this.songName,
//       required this.profileImg,
//       required this.likes,
//       required this.comments,
//       required this.shares,
//       required this.albumImg})
//       : super(key: key);

//   @override
//   State<VideoItem> createState() => _VideoItemState();
// }

// class _VideoItemState extends State<VideoItem>
//     with SingleTickerProviderStateMixin {
//   late VideoPlayerController _videoPlayerController;

//   @override
//   void initState() {
//     super.initState();
//     _videoPlayerController = VideoPlayerController.asset(widget.videoUrl)
//       ..initialize().then((value) {
//         _videoPlayerController.play();
//       });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _videoPlayerController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return 
//   }
// }
