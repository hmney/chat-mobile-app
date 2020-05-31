import 'package:app/src/stores/authentication/authentication_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                Modular.to.pop();
              },
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
            onTap: () => Provider.of<AuthenticationStore>(context).signOut(),
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
    );
  }
}
