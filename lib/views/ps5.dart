import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicapp/utils/margin.dart';
import 'package:musicapp/utils/spring_button.dart';
import 'package:musicapp/utils/theme.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'provider/ps5.dart';

class Ps5 extends StatefulWidget {
  Ps5({Key key}) : super(key: key);

  @override
  _Ps5State createState() => _Ps5State();
}

class _Ps5State extends State<Ps5> {
  final controller = PageController(viewportFraction: 0.88);

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<Ps5VM>();
    return Scaffold(
      backgroundColor: prov.dark ? Color(0xFF011E24) : white,
      body: Column(
        children: [
          const YMargin(30),
          Image.asset(
            'assets/images/ps5.png',
            color: (prov.dark ? white : grey).withOpacity(0.8),
            height: 15,
          ),
          const YMargin(40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 90),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey[200],
                      borderRadius: BorderRadius.circular(4),
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: NetworkImage(
                              'https://pbs.twimg.com/profile_images/1274197880635621376/ZCJygPAs_400x400.jpg'))),
                ),
                Spacer(),
                Spacer(),
                Text(
                  'L1',
                  style: GoogleFonts.lato(
                      fontSize: 11,
                      color: (prov.dark ? white : textColor).withOpacity(0.2),
                      fontWeight: FontWeight.w400),
                ),
                Spacer(),
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    color: accent.withOpacity(0.1),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                    child: Text(
                      'Home',
                      style: GoogleFonts.lato(
                          fontSize: 13,
                          color: (prov.dark ? white : textColor),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  'Library',
                  style: GoogleFonts.lato(
                      fontSize: 13,
                      color: (prov.dark ? white.withOpacity(0.3) : textColor),
                      fontWeight: FontWeight.w400),
                ),
                Spacer(),
                Text(
                  'Store',
                  style: GoogleFonts.lato(
                      fontSize: 13,
                      color: (prov.dark ? white.withOpacity(0.3) : textColor),
                      fontWeight: FontWeight.w400),
                ),
                Spacer(),
                Text(
                  'Media',
                  style: GoogleFonts.lato(
                      fontSize: 13,
                      color: (prov.dark ? white.withOpacity(0.3) : textColor),
                      fontWeight: FontWeight.w400),
                ),
                Spacer(),
                Text(
                  'R1',
                  style: GoogleFonts.lato(
                      fontSize: 11,
                      color: (prov.dark ? white : textColor).withOpacity(0.2),
                      fontWeight: FontWeight.w400),
                ),
                Spacer(),
                Spacer(),
                Text(
                  '11:12 PM',
                  style: GoogleFonts.lato(
                      fontSize: 13,
                      color: prov.dark ? white : textColor,
                      fontWeight: FontWeight.w400),
                ),
                const YMargin(50),
                IconButton(
                  icon: Icon(prov.dark ? FeatherIcons.sun : FeatherIcons.moon),
                  color: prov.dark ? white : iconColor,
                  iconSize: 14,
                  onPressed: () {
                    prov.dark = !prov.dark;
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: games.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Center(
                child: GameItem(index),
              ),
            ),
          ),
          const YMargin(50),
          SmoothPageIndicator(
            controller: controller,
            count: 6,
            effect: ExpandingDotsEffect(
                expansionFactor: 4,
                activeDotColor: prov.dark ? Color(0xffF3CA3E) : accent,
                dotColor:
                    (prov.dark ? Color(0xffF3CA3E) : accent).withOpacity(0.1)),
          ),
          const YMargin(50),
        ],
      ),
    );
  }
}

class GameItem extends StatelessWidget {
  final int index;

  const GameItem(this.index);
  @override
  Widget build(BuildContext context) {
    var prov = context.watch<Ps5VM>();
    return Center(
      child: Container(
        height: context.screenHeight(.5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SpringButton(
              child: Container(
                height: context.screenWidth(.26),
                width: context.screenWidth(.26),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 97,
                          spreadRadius: -70,
                          color: Color(0xffE4B36B),
                          offset: Offset(0, 32))
                    ],
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            'assets/images/${games[index].img}.png'))),
              ),
              onTap: () {},
            ),
            const XMargin(100),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/ps4.png',
                      color: prov.dark ? white.withOpacity(0.8) : textColor,
                      height: 13,
                    ),
                    const XMargin(10),
                    Text(
                      'Last Played ${index + 2} days ago',
                      style: GoogleFonts.ubuntu(
                          fontSize: 11,
                          color: prov.dark ? white.withOpacity(0.8) : black,
                          height: 1.4,
                          fontWeight: FontWeight.w200),
                    ),
                  ],
                ),
                const YMargin(10),
                Text(
                  games[index]?.name ?? '',
                  style: GoogleFonts.ptSans(
                      fontSize: 40,
                      color: prov.dark ? white : black,
                      height: 1.4,
                      fontWeight: FontWeight.w400),
                ),
                const YMargin(40),
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    color: (prov.dark ? white : accent).withOpacity(0.1),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                    child: Row(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            color: prov.dark ? Color(0xffF3CA3E) : accent,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Icon(
                            Icons.close,
                            color: prov.dark ? iconColor : white,
                            size: 13,
                          ),
                        ),
                        const XMargin(10),
                        Text(
                          'Tap to Start',
                          style: GoogleFonts.lato(
                              fontSize: 12,
                              color: prov.dark ? Color(0xffE4B36B) : accent,
                              fontWeight: FontWeight.w400),
                        ),
                        const XMargin(10),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Game {
  final name, img;

  Game({@required this.name, @required this.img});
}

var games = [
  Game(img: 'g6', name: "The Last Of Us"),
  Game(img: 'g0', name: "Assasin's Creed: VALHALLA"),
  Game(img: 'g1', name: 'Sekiro: Shadows Die Twice'),
  Game(img: 'g2', name: 'Red Dead Redemption II'),
  Game(img: 'g3', name: 'APEX Legends'),
  Game(img: 'g4', name: "EA's FIFA 2020"),
];
