import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicapp/utils/theme.dart';
import 'package:musicapp/utils/margin.dart';

import 'menu.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldkey,
      drawer: Drawer(),
      body: Container(
        color: Color(0xffF8F8F8),
        child: Stack(
          children: [
            Row(
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: MenuSection(),
                ),
                Flexible(
                  flex: 10,
                  child: Container(
                    child: Column(
                      children: [
                        const YMargin(90),
                        Flexible(child: HomeSection())
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Column(
                    children: [
                      const YMargin(90),
                      Flexible(
                        child: Player(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
              child: Row(
                children: [
                  Container(
                    height: context.screenHeight(.05),
                    width: context.screenWidth(.12),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: FlatButton(
                          color: accent,
                          padding: EdgeInsets.all(0),
                          onPressed: () {},
                          child: Row(
                            children: [
                              const XMargin(10),
                              Text(
                                'Create Playlist',
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      color: white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ),
                              Spacer(),
                              Container(
                                color: Color(0xff2680FC),
                                height: context.screenHeight(.05),
                                width: context.screenWidth(.034),
                                child: Icon(
                                  Icons.playlist_add,
                                  color: white,
                                  size: 15,
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                  const XMargin(35),
                  Text(
                    'Featured Tracks',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: iconColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                  const XMargin(35),
                  Text(
                    'Charts',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: iconColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                  const XMargin(35),
                  Text(
                    'Videos',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: iconColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Player extends StatelessWidget {
  const Player({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0xffECECF4),
          ),
        ),
      ),
      child: Center(
        child: Container(
          child: Column(
            children: [
              const YMargin(50),
              Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: context.screenWidth(.11),
                      width: context.screenWidth(.11),
                      child: CircularProgressIndicator(
                        value: 0.8,
                        strokeWidth: 2.5,
                        backgroundColor: Color(0xFFEBEBF3),
                        valueColor: AlwaysStoppedAnimation(Color(0xFF1269FB)),
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            height: context.screenWidth(.08),
                            width: context.screenWidth(.08),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.8),
                                      blurRadius: 18,
                                      offset: Offset(0, 18))
                                ],
                                color: Colors.blueGrey[200],
                                borderRadius: BorderRadius.circular(100),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('assets/images/11.png'))),
                          ),
                        ),
                        const YMargin(40),
                        Text('Heartless',
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    color: iconColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15))),
                        const YMargin(5),
                        Text(
                          'The Weeknd',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                color: Color(0xffB7BDCC),
                                fontWeight: FontWeight.w400,
                                fontSize: 11),
                          ),
                        ),
                        const YMargin(25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.fast_rewind, size: 14, color: iconColor),
                            const XMargin(10),
                            Icon(Icons.pause, size: 14, color: iconColor),
                            const XMargin(10),
                            Icon(Icons.fast_forward,
                                size: 14, color: iconColor),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HomeSection extends StatefulWidget {
  const HomeSection({
    Key key,
  }) : super(key: key);

  @override
  _HomeSectionState createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> {
  var list = [
    SongCard(
      title: 'hot girl bummer',
      img: '1',
      sub: 'Pop Music',
    ),
    SongCard(
      title: 'Geng',
      img: '10',
      sub: 'Afro Pop',
    ),
    SongCard(
      title: 'Sub Urban - Cradles',
      img: '2',
      sub: 'Alternative',
    ),
    SongCard(
      title: 'Changes',
      img: '3',
      sub: 'Pop Music',
    ),
    SongCard(
      title: 'Angel',
      img: '5',
      sub: 'Electronic',
    ),
    SongCard(
      title: 'The Take',
      img: '6',
      sub: 'RnB / Soul',
    ),
  ];

  void _onReorder(int oldIndex, int newIndex) {
    setState(
      () {
        if (newIndex > oldIndex) {
          newIndex -= 1;
        }
        final Widget item = list.removeAt(oldIndex);
        list.insert(newIndex, item);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0xffECECF4),
          ),
          right: BorderSide(
            color: Color(0xffECECF4),
          ),
        ),
      ),
      child: ListView(
        children: [
          const YMargin(50),
          Container(
            height: context.screenHeight(.3),
            child: ReorderableListView(
              onReorder: _onReorder,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 40),
              scrollController: ScrollController(),
              // buildDraggableFeedback: (a, b, c) => Container(),
              children: List.generate(
                list.length,
                (index) {
                  return Container(
                    child: list[index],
                    key: Key('$index'),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 4,
                  child: Tracks(),
                ),
                const XMargin(30),
                Flexible(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Listening History',
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  color: iconColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16))),
                      const YMargin(25),
                      Container(
                        height: context.screenHeight(.314),
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 10,
                              spreadRadius: -11,
                            )
                          ],
                        ),
                        padding: EdgeInsets.fromLTRB(15, 14, 15, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ListenItem(
                              img: '1',
                              title: 'hot girl bummer',
                              sub: 'blackbear',
                            ),
                            Spacer(),
                            ListenItem(
                              img: '8',
                              title: 'Tusa',
                              sub: 'Karol G & Nicki Minaj',
                            ),
                            Spacer(),
                            ListenItem(
                              img: '9',
                              title: 'Falling',
                              sub: 'Trevor Daniel',
                            ),
                            Spacer(),
                            ListenItem(
                              img: '2',
                              title: 'Cradles',
                              sub: 'Sub Urban',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ListenItem extends StatelessWidget {
  final String img, title, sub;

  const ListenItem(
      {Key key, @required this.img, @required this.title, @required this.sub})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Container(
            height: context.screenHeight(.045),
            width: context.screenHeight(.045),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/$img.png'))),
          ),
          const XMargin(25),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title ?? '',
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: iconColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 13))),
              const YMargin(4),
              Text(
                sub ?? '',
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        color: Color(0xffB7BDCC),
                        fontWeight: FontWeight.w400,
                        fontSize: 11)),
              ),
            ],
          ),
          Spacer(),
          Play(),
        ],
      ),
    );
  }
}

class Tracks extends StatelessWidget {
  const Tracks({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text('Tracks for You',
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: iconColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16))),
        ),
        const YMargin(25),
        TrackItem(
          title: 'Tusa',
          img: '7',
          artiste: 'Karol G',
          time: '3:21',
        ),
        TrackItem(
          title: 'No Idea',
          img: '8',
          artiste: 'Don Toliver',
          time: '3:21',
        ),
        TrackItem(
          title: 'The Take',
          img: '6',
          artiste: 'Tory Lanez',
          time: '3:41',
        ),
        TrackItem(
          title: 'Suzanna',
          img: '4',
          artiste: 'Sauti Soul',
          time: '3:51',
        ),
      ],
    );
  }
}

class TrackItem extends StatelessWidget {
  final String img, title, artiste, time;

  const TrackItem({
    Key key,
    @required this.img,
    @required this.title,
    @required this.artiste,
    @required this.time,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            blurRadius: 10,
            spreadRadius: -11,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const XMargin(20),
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      blurRadius: 18,
                      offset: Offset(0, 8))
                ],
                color: Colors.blueGrey[200],
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/$img.png'))),
          ),
          const XMargin(25),
          Container(
            width: context.screenWidth(.04),
            child: Text(
              title ?? '',
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: iconColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 13)),
            ),
          ),
          Spacer(),
          Container(
            width: context.screenWidth(.06),
            child: Text(
              artiste ?? '',
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: iconColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 13)),
            ),
          ),
          Spacer(),
          Text(
            time ?? '',
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: accent, fontWeight: FontWeight.w400, fontSize: 13)),
          ),
          Spacer(),
          Play(),
          const XMargin(20),
        ],
      ),
    );
  }
}

class Play extends StatelessWidget {
  const Play({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(
        color: accent,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Icon(
        Icons.play_arrow,
        color: white,
        size: 15,
      ),
    );
  }
}

class SongCard extends StatelessWidget {
  final String img, title, sub;

  const SongCard(
      {Key key, @required this.img, @required this.title, @required this.sub});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 45),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: context.screenHeight(.17),
            width: context.screenHeight(.17),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 26,
                    spreadRadius: -11,
                    offset: Offset(0, 20),
                  )
                ],
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/$img.png'))),
          ),
          const YMargin(20),
          Text(title ?? '',
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: iconColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12))),
          const YMargin(4),
          Text(
            sub ?? '',
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: Color(0xffB7BDCC),
                    fontWeight: FontWeight.w400,
                    fontSize: 11)),
          ),
        ],
      ),
    );
  }
}
