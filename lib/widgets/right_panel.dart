import 'package:flutter/material.dart';
import 'package:tiktokclone/constant/data_json.dart';
import 'package:tiktokclone/theme/colors.dart';

class RightPanel extends StatelessWidget {
  final String profileImg;
  final String likes;
  final String comments;
  final String shares;
  final String albumImg;

  const RightPanel({
    Key? key,
    required this.profileImg,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.albumImg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Expanded(
      // ignore: sized_box_for_whitespace
      child: Container(
        height: size.height,
        child: Column(
          children: <Widget>[
            Container(
              height: size.height * 0.2,
            ),
            Expanded(
              // color: primary,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  getProfile(profileImg),
                  getIcon(Icons.favorite, likes),
                  getIcon(Icons.chat_bubble_outline, comments),
                  getIcon(Icons.reply, shares),
                  getAlbum(albumImg),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget getProfile(profileImg) {
  return Container(
    height: 55,
    width: 55,
    child: Stack(
      children: <Widget>[
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                profileImg,
              ),
            ),
            border: Border.all(color: Colors.white, width: 2),
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
          ),
        ),
        Positioned(
          bottom: -5,
          left: 15,
          child: Container(
            height: 20,
            width: 20,
            decoration: const BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            child: const Center(
              child: Icon(
                Icons.add,
                color: white,
                size: 17,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget getIcon(icon, text) {
  return Column(
    children: <Widget>[
      Icon(icon, color: white, size: 35),
      const SizedBox(height: 5),
      Text(
        text,
        style: const TextStyle(
          color: white,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}

getAlbum(albumImg) {
  // ignore: sized_box_for_whitespace
  return Container(
    height: 55,
    width: 55,
    child: Stack(
      children: <Widget>[
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                albumImg,
              ),
            ),
            border: Border.all(color: white, width: 10),
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
          ),
        ),
      ],
    ),
  );
}
