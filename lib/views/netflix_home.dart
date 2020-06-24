import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicapp/utils/margin.dart';
import 'package:musicapp/utils/navigator.dart';
import 'package:musicapp/utils/theme.dart';
import 'package:musicapp/views/provider/netflix_vm.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'netflix.dart';

class NetflixHome extends StatefulWidget {
  NetflixHome({Key key}) : super(key: key);

  @override
  _NetflixHomeState createState() => _NetflixHomeState();
}

class _NetflixHomeState extends State<NetflixHome> {
  @override
  void initState() {
    context.read<NetflixVM>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<NetflixVM>();
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/img2.png'),
              ),
            ),
          ),
          Row(
            children: [
              Flexible(
                flex: 7,
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/nfx_logo.png',
                          height: 20,
                        ),
                        const YMargin(50),
                        Text(
                          'MENU',
                          style: GoogleFonts.lato(
                              fontSize: 6,
                              letterSpacing: 1,
                              color: white,
                              fontWeight: FontWeight.w400),
                        ),
                        const YMargin(20),
                        MenuItem('MY', 'LIST'),
                        MenuItem('RECENT', 'MOVIES'),
                        MenuItem('TRENDING', 'NOW'),
                        Spacer(),
                        Text(
                          'LIBRARY',
                          style: GoogleFonts.lato(
                              fontSize: 6,
                              letterSpacing: 1,
                              color: white,
                              fontWeight: FontWeight.w400),
                        ),
                        const YMargin(20),
                        MenuItem('NETFLIX', 'ORIGINALS'),
                        MenuItem('US', 'TV SHOWS'),
                        MenuItem('TO 10', 'NIGERIA'),
                        Spacer(),
                        Container(
                          height: 39,
                          width: context.screenWidth(0.13),
                          child: RaisedButton(
                            color: Color(0xFFCE0D0D),
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                            onPressed: () {},
                            child: Text(
                              'UPGRADE',
                              style: GoogleFonts.lato(
                                  fontSize: 9,
                                  letterSpacing: 1,
                                  color: white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Text(
                              'NETFLIX ',
                              style: GoogleFonts.lato(
                                  fontSize: 7,
                                  letterSpacing: 1,
                                  color: white.withOpacity(0.2),
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              '1.39',
                              style: GoogleFonts.lato(
                                  fontSize: 7,
                                  letterSpacing: 1,
                                  color: white.withOpacity(0.2),
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 22,
                child: Container(
                  ///

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 60, vertical: 40),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              FeatherIcons.search,
                              color: white,
                              size: 11,
                            ),
                            const XMargin(20),
                            Flexible(
                              flex: 2,
                              child: TextField(
                                cursorColor: white,
                                style: GoogleFonts.lato(
                                    fontSize: 12,
                                    color: white,
                                    letterSpacing: 1.2,
                                    fontWeight: FontWeight.w500),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Search...',
                                  hintStyle: GoogleFonts.lato(
                                      fontSize: 11,
                                      color: white.withOpacity(0.6),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ),
                            Spacer(),
                            Text(
                              'Chiziaruhoma',
                              style: GoogleFonts.lato(
                                  fontSize: 8,
                                  letterSpacing: 1,
                                  color: white,
                                  fontWeight: FontWeight.bold),
                            ),
                            const XMargin(10),
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey[200],
                                  borderRadius: BorderRadius.circular(100),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          'https://pbs.twimg.com/profile_images/1274197880635621376/ZCJygPAs_400x400.jpg'))),
                            ),
                          ],
                        ),
                      ),
                      YMargin(context.screenHeight(0.15)),
                      Expanded(
                        child: PageView(
                          controller: prov.controller,
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (i) {
                            prov.selectedIndex = i;
                            prov.assetsAudioPlayer2.setVolume(0.2);
                            prov.assetsAudioPlayer2.stop();
                            prov.assetsAudioPlayer2.play();
                          },
                          children: [
                            MovieCard(
                              index: 0,
                              title: 'STRANGER',
                              title2: 'THINGS',
                            ),
                            MovieCard(
                              index: 1,
                              title: 'STRANGER',
                              title2: 'THINGS',
                            ),
                            MovieCard(
                              index: 2,
                              title: 'STRANGER',
                              title2: 'THINGS',
                            ),
                          ],
                        ),
                      ),
                      YMargin(context.screenHeight(0.2)),
                      Stack(
                        children: [
                          Center(
                            child: SmoothPageIndicator(
                              controller: prov.controller,
                              count: 3,
                              effect: SwapEffect(
                                  // expansionFactor: 4,
                                  dotHeight: 8,
                                  dotWidth: 8,
                                  activeDotColor: Color(0xFFCE0D14),
                                  dotColor: white.withOpacity(0.1)),
                            ),
                          ),
                          Row(
                            children: [
                              Spacer(),
                              Image.asset(
                                'assets/images/nfx_logo.png',
                                height: 27,
                                color: white.withOpacity(0.3),
                              ),
                              const XMargin(60)
                            ],
                          ),
                        ],
                      ),
                      const YMargin(50),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  final String title, title2;
  final int index;

  const MovieCard({
    Key key,
    @required this.title,
    @required this.title2,
    @required this.index,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var prov = context.watch<NetflixVM>();
    return GestureDetector(
      onTap: () {
        prov.controller.animateToPage(index,
            curve: Curves.easeInOut, duration: Duration(milliseconds: 900));
      },
      onDoubleTap: () async{
       await  prov.assetsAudioPlayer2.play();
        navigateTransparentRoute(context, Netflix(tag: index));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Stack(
          children: [
            Hero(
              tag: '$index',
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: context.screenWidth(
                  prov.selectedIndex == index ? 0.27 : 0.25,
                ),
                height: context.screenHeight(
                  prov.selectedIndex == index ? 0.35 : 0.3,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: ExactAssetImage(
                        'assets/images/nfx${index > 0 ? index : ''}.png'),
                  ),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: AnimatedContainer(
                width: context.screenWidth(
                  prov.selectedIndex == index ? 0.27 / 2 : 0.25 / 2,
                ),
                height: context.screenHeight(
                  prov.selectedIndex == index ? 0.35 : 0.3,
                ),
                duration: Duration(milliseconds: 500),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 6, sigmaY: 5.0),
                  child: Container(
                    color: Colors.grey.withOpacity(0.1),
                    padding: EdgeInsets.only(left: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title ?? '',
                          style: GoogleFonts.lato(
                              fontSize: prov.selectedIndex == index ? 19 : 14,
                              letterSpacing: 1,
                              color: white,
                              fontWeight: FontWeight.bold),
                        ),
                        const YMargin(5),
                        Text(
                          title2 ?? '',
                          style: GoogleFonts.lato(
                              fontSize: prov.selectedIndex == index ? 17 : 13,
                              letterSpacing: 1,
                              color: white,
                              fontWeight: FontWeight.w200),
                        ),
                        const YMargin(25),
                        Text(
                          'SEASON 3 EP ${5 + index}',
                          style: GoogleFonts.lato(
                              fontSize: prov.selectedIndex == index ? 8 : 5,
                              letterSpacing: 1,
                              color: white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (prov.selectedIndex == index)
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: context.screenWidth(
                  prov.selectedIndex == index ? 0.27 : 0.25,
                ),
                height: context
                    .screenHeight(prov.selectedIndex == index ? 0.35 : 0.3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Color(0xFFCE0D14), width: 3),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String s, l;
  const MenuItem(this.s, this.l);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          hoverColor: Colors.black38,
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${s ?? ''} ',
                  style: GoogleFonts.lato(
                      fontSize: 10,
                      letterSpacing: 1,
                      color: white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  l ?? '',
                  style: GoogleFonts.lato(
                      fontSize: 10,
                      letterSpacing: 1,
                      color: white,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
