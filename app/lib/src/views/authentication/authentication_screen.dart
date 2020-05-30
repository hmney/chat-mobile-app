import 'package:app/src/stores/authentication/authentication_store.dart';
import 'package:app/src/views/authentication/login.dart';
import 'package:app/src/views/authentication/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class AuthenticationScreen extends StatefulWidget {
  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          key: _scaffoldKey,
          resizeToAvoidBottomPadding: false,
          backgroundColor: Theme.of(context).accentColor,
          body: Column(
            children: <Widget>[
              Center(
                child: Container(
                  width: 75,
                  height: 75,
                  padding: EdgeInsets.all(8.0),
                  margin: EdgeInsets.all(45),
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: Offset(0, 3),
                        blurRadius: 8,
                      )
                    ],
                  ),
                  child: SvgPicture.asset('assets/images/PinkHeart.svg'),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 2),
                        blurRadius: 5),
                  ],
                ),
                child: TabBar(
                  unselectedLabelColor:
                      Theme.of(context).primaryColor.withOpacity(0.5),
                  labelColor: Theme.of(context).primaryColor,
                  labelStyle: TextStyle(
                    fontFamily: 'Open Sans',
                    fontSize: 24,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                  indicatorColor: Theme.of(context).primaryColor,
                  indicatorWeight: 4,
                  tabs: <Widget>[
                    Tab(
                      text: 'Login',
                    ),
                    Tab(
                      text: 'Signup',
                    )
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    Login(),
                    Signup(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
