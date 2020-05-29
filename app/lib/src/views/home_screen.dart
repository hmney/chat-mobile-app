import 'package:app/src/stores/authentication/authentication_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).accentColor,
        body: Column(
          children: <Widget>[
            Center(
              child: Text('This is Home'),
            ),
            Center(
              child: RaisedButton(
                onPressed: () =>
                    Provider.of<AuthenticationStore>(context).signOut(),
                child: Text('sign out'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
