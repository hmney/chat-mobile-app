import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GetStartedScreen extends StatefulWidget {
  @override
  _GetStartedScreenState createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/get_started.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SvgPicture.asset('assets/images/GetStartedScreenLogo.svg'),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: 300,
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: RaisedButton(
                  onPressed: () {
                  },
                  color: Theme.of(context).primaryColor,
                  hoverColor: Theme.of(context).primaryColorLight,
                  child: Text(
                    'GET STARTED',
                    style: TextStyle(
                      fontFamily: 'Open Sans',
                      fontSize: 18,
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}