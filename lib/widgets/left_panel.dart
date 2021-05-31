import 'package:flutter/material.dart';
import 'package:tiktokclone/theme/colors.dart';

class LeftPanel extends StatelessWidget {
  final String name;
  final String caption;
  final String songName;
  const LeftPanel({
    Key? key,
    required this.name,
    required this.caption,
    required this.songName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        width: size.width * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              name,
              style: TextStyle(color: white),
            ),
            SizedBox(height: 10),
            Text(
              caption,
              style: TextStyle(color: white),
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Icon(
                  Icons.music_note,
                  color: white,
                  size: 15,
                ),
                Text(
                  songName,
                  style: TextStyle(color: white, fontSize: 12),
                ),
              ],
            )
          ],
        ));
  }
}
