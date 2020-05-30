import 'package:app/routes/app_routes.dart';
import 'package:app/src/views/home/empty_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).accentColor,
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.close),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 110, 0, 70),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Image.asset('assets/images/kindpng_786207.png'),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Text(
                        'username',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: 'Open Sans',
                        ),
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Icon(
                        Icons.person,
                        size: 24,
                      ),
                    ),
                    Container(
                      child: Text(
                        'Profile',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: 'Open Sans',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Icon(Icons.exit_to_app),
                    ),
                    Container(
                      child: Text(
                        'Log out',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: 'Open Sans',
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.sort,
              color: Colors.black,
              size: 24,
            ),
            onPressed: () => _scaffoldKey.currentState.openDrawer(),
          ),
          title: Text(
            'Lover\'s',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
                size: 24,
              ),
              onPressed: () {},
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: EmptyHome(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () {
            Modular.to.pushNamed(
              pathForRoute(APP_ROUTE.NEW_CHAT),
            );
          },
          child: Icon(
            Icons.message,
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
