import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicapp/utils/margin.dart';
import 'package:musicapp/utils/navigator.dart';
import 'package:musicapp/utils/theme.dart';
import 'package:provider/provider.dart';

import 'provider/netflix_vm.dart';

class Netflix extends StatefulWidget {
  final int tag;
  Netflix({Key key, this.tag}) : super(key: key);

  @override
  _NetflixState createState() => _NetflixState();
}

class _NetflixState extends State<Netflix> with TickerProviderStateMixin {
  AnimationController animation;
  Animation<double> _fadeInFadeOut;

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 1).animate(animation);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //  animation.reverse();
      }
    });
    animation.forward();
  }
@override
  void dispose() {
   animation.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var prov = context.watch<NetflixVM>();

    return Theme(
      data: Theme.of(context).copyWith(),
      child: GestureDetector(
        onDoubleTap: ()async {
          await prov.assetsAudioPlayer2.play();
          popView(context);
        },
        child: Material(
            color: Colors.transparent,
            child: Stack(
              children: [
                Hero(
                  tag: '${widget.tag}',
                  child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.blueGrey[200],
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: ExactAssetImage(
                                'assets/images/nfx${widget.tag > 0 ? widget.tag : ''}.png'),
                          ))),
                ),
                FadeTransition(
                  opacity: _fadeInFadeOut,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 40),
                    child: ListView(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                prov.assetsAudioPlayer2.stop();
                                prov.assetsAudioPlayer2.play();
                                popView(context);
                              },
                              child: Image.asset(
                                'assets/images/nfx_logo.png',
                                height: 27,
                              ),
                            ),
                            Spacer(),
                            Text(
                              'About',
                              style: GoogleFonts.lato(
                                  fontSize: 10,
                                  letterSpacing: 1.1,
                                  color: white.withOpacity(0.9),
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                        const YMargin(120),
                        Text(
                          'STRANGER',
                          style: GoogleFonts.lato(
                              fontSize: 39,
                              letterSpacing: 3,
                              color: white,
                              fontWeight: FontWeight.bold),
                        ),
                        const YMargin(5),
                        Text(
                          'THINGS',
                          style: GoogleFonts.lato(
                              fontSize: 37,
                              letterSpacing: 3,
                              color: white,
                              fontWeight: FontWeight.w200),
                        ),
                        const YMargin(25),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: context.screenWidth(0.305),
                              child: Text(
                                'After the mysterious and sudden vanishing of a young boy, the people of a small town begin to uncover secrets of a government lab, portals to another world and sinister monsters.',
                                style: GoogleFonts.lato(
                                    fontSize: 11,
                                    letterSpacing: 1.3,
                                    height: 2,
                                    color: white,
                                    fontWeight: FontWeight.w200),
                              ),
                            ),
                            const YMargin(60),
                            Container(
                              height: 29,
                              child: OutlineButton(
                                color: white,
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                borderSide: BorderSide(
                                  color: white.withOpacity(0.7),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0)),
                                highlightedBorderColor: Colors.red,
                                onPressed: () {},
                                child: Text(
                                  'Start Watching',
                                  style: GoogleFonts.lato(
                                      fontSize: 9,
                                      letterSpacing: 1,
                                      color: white,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            )
                          ],
                        ),
                        YMargin(context.screenWidth(0.11)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Created By    ',
                              style: GoogleFonts.lato(
                                color: white.withOpacity(0.5),
                                fontSize: 9,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              'The Duffer Brothers',
                              style: GoogleFonts.lato(
                                  fontSize: 9,
                                  color: white.withOpacity(0.8),
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
