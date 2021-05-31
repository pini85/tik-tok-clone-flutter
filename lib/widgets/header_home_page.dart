import 'package:flutter/material.dart';
import 'package:tiktokclone/theme/colors.dart';

class HeaderHomePage extends StatelessWidget {
  const HeaderHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Following",
          style: TextStyle(
            color: white.withOpacity(0.5),
            fontSize: 16,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          "|",
          style: TextStyle(
            color: white.withOpacity(0.5),
            fontSize: 16,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          "For You",
          style: TextStyle(
              color: white.withOpacity(0.9),
              fontSize: 17,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
