import "package:flutter/material.dart";
import 'package:tiktokclone/pages/home_page.dart';
import 'package:tiktokclone/widgets/tik_tok_icons.dart';
import 'package:tiktokclone/widgets/upload_icon.dart';
import "../theme/colors.dart";

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  var _pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: _pageIndex,
      children: <Widget>[
        HomePage(),
        Center(
          child: Text(
            "Discover",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: black),
          ),
        ),
        Center(
          child: Text(
            "Upload",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: black),
          ),
        ),
        Center(
          child: Text(
            "All Activity",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: black),
          ),
        ),
        Center(
          child: Text(
            "Profile",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: black),
          ),
        ),
      ],
    );
  }

  Widget getFooter() {
    var size = MediaQuery.of(context).size;
    List bottomItems = [
      {
        "icon": Icons.home,
        "label": "Home",
        "isIcon": true,
      },
      {
        "icon": Icons.search,
        "label": "Discover",
        "isIcon": true,
      },
      {
        "icon": "",
        "label": "",
        "isIcon": false,
      },
      {
        "icon": Icons.favorite,
        "label": "Inbox",
        "isIcon": true,
      },
      {
        "icon": Icons.person,
        "label": "Me",
        "isIcon": true,
      },
    ];
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(color: appBgColor),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(bottomItems.length, (index) {
              return bottomItems[index]["isIcon"]
                  ? InkWell(
                      onTap: () => selectedIndex(index),
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: <Widget>[
                          Icon(
                            bottomItems[index]["icon"],
                            color: white,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            bottomItems[index]["label"],
                            style: const TextStyle(color: white, fontSize: 10),
                          )
                        ],
                      ),
                    )
                  : InkWell(
                      onTap: () => selectedIndex(index), child: UploadIcon());
            })),
      ),
    );
  }

  selectedIndex(index) {
    setState(() {
      _pageIndex = index;
    });
  }
}
