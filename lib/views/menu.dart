import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:musicapp/utils/margin.dart';
import 'package:musicapp/utils/theme.dart';

class MenuSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0XFFF3F3F3),
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 40),
        children: [
          const YMargin(100),
          MenuItem(
            icon: LineIcons.compass,
            title: 'Explore',
          ),
          MenuItem(
            icon: FeatherIcons.radio,
            title: 'Stations',
          ),
          MenuItem(
            icon: FeatherIcons.inbox,
            title: 'Inbox',
          ),
          MenuItem(
            icon: FeatherIcons.mic,
            title: 'Artist',
          ),
          MenuItem(
            icon: FeatherIcons.disc,
            title: 'Albums',
          ),
          MenuItem(
            icon: FeatherIcons.settings,
            title: 'Settings',
          ),
          const YMargin(50),
          Text(
            'Your Playlists',
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: Color(0xffB7BDCC),
                    fontWeight: FontWeight.w500,
                    fontSize: 14)),
          ),
          const YMargin(30),
          Text(
            'Old Days',
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: iconColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 13)),
          ),
          const YMargin(20),
          Text(
            'Honeymoon',
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: iconColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 13)),
          ),
          const YMargin(20),
          Text(
            'Master Pieces',
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: iconColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 13)),
          ),
          const YMargin(50),
          Text(
            'Collections',
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: Color(0xffB7BDCC),
                    fontWeight: FontWeight.w500,
                    fontSize: 14)),
          ),
          const YMargin(30),
          CollectionItem(
            title: 'Animals',
            url: null,
          ),
          const YMargin(20),
          CollectionItem(
            title: 'Karbon',
            url: null,
          ),
          const YMargin(20),
          CollectionItem(
            title: 'Saxify',
            url: null,
          ),
        ],
      ),
    );
  }
}

class CollectionItem extends StatelessWidget {
  final String title, url;

  const CollectionItem({
    Key key,
    @required this.title,
    @required this.url,
  });
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Row(
            children: [
              Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                    color: Colors.blueGrey[200],
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(url ??
                            'https://pbs.twimg.com/profile_images/1274197880635621376/ZCJygPAs_400x400.jpg'))),
              ),
              const XMargin(10),
              Text(
                title ?? '',
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        color: iconColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 13)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const MenuItem({
    Key key,
    @required this.icon,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: iconColor,
                    size: 14,
                  ),
                  const XMargin(10),
                  Text(
                    title ?? '',
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: iconColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 13)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
