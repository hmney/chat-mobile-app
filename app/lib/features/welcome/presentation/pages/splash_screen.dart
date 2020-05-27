import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                width: 200.0,
                height: 200.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(44.0),
                  color: Theme.of(context).accentColor,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: Offset(0, 3),
                        blurRadius: 10,
                        spreadRadius: 2)
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.string(
                      _logo,
                      allowDrawingOutsideViewBox: true,
                    ),
                  ),
                  Text(
                    'LOVER\'S MSG',
                    style: TextStyle(
                      fontFamily: 'Open Sans',
                      fontSize: 24,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w700,
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

const String _logo =
    '<svg viewBox="118.0 338.0 138.7 123.4" ><g transform="translate(-9.01, 321.72)"><g transform="translate(127.01, 16.28)"><path transform="translate(-127.01, -16.28)" d="M 166.0111999511719 16.28437614440918 C 127.0648727416992 15.58415985107422 91.02436828613281 76.49197387695313 196.0258636474609 139.6405029296875 C 196.1410064697266 139.4333190917969 196.583740234375 139.4333190917969 196.6988525390625 139.6405029296875 C 305.0872802734375 74.45493316650391 263.1923828125 11.66596794128418 222.94482421875 16.55356788635254 C 207.2546844482422 18.45898056030273 199.8504486083984 27.16705894470215 196.3623657226563 34.65655899047852 C 192.8742980957031 27.16705894470215 185.4700164794922 18.45898818969727 169.7799377441406 16.55356788635254 C 168.5221862792969 16.4007625579834 167.2676391601563 16.3069953918457 166.0112915039063 16.28436279296875 L 166.0112915039063 16.28436088562012 Z" fill="#ff007f" stroke="none" stroke-width="3.799730062484741" stroke-linecap="butt" stroke-linejoin="round" /></g></g></svg>';
