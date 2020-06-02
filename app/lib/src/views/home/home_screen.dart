import 'package:app/routes/app_routes.dart';
import 'package:app/src/stores/chat/chat_store.dart';
import 'package:app/src/widgets/my_drawer.dart';
import 'package:app/src/widgets/chat_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Provider.of<ChatStore>(context).getThisUid();
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
        body: StreamBuilder(
          stream: Provider.of<ChatStore>(context).getAllMessages(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  return ChatItem();
                },
              );
            }
            return Container();
          },
        ),
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
