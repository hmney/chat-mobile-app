import 'package:app/routes/app_routes.dart';
import 'package:app/src/views/home/empty_home.dart';
import 'package:app/src/widgets/my_drawer.dart';
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
        drawer: MyDrawer(),
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
