import 'package:app/routes/app_routes.dart';
import 'package:app/src/models/contact_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ChatItem extends StatefulWidget {
  final DocumentSnapshot contact;

  ChatItem({@required this.contact}) : assert(contact != null);
  @override
  _ChatItemState createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem> {
  DocumentSnapshot get contact => widget.contact;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Modular.to.pushNamed(
          pathForRoute(APP_ROUTE.CHAT),
          arguments: ContactModel.fromJson(contact.data),
        );
      },
      child: Container(
        margin: EdgeInsets.all(20),
        width: 300,
        height: 65,
        child: Row(children: <Widget>[
          leftSection(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                topRightSection(),
                bottomRightSection(),
                Container(
                  margin: EdgeInsets.only(
                    left: 15,
                  ),
                  child: Divider(),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }

  Widget leftSection() {
    return Container(
      width: 64,
      height: 64,
      child: CircleAvatar(
        backgroundColor: Colors.blue,
        backgroundImage: NetworkImage(
            'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80'),
        radius: 24,
      ),
    );
  }

  Widget topRightSection() {
    return Container(
      margin: EdgeInsets.only(left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            contact['contact_details']['username'],
            style: TextStyle(
              color: Color(0xfffe6fb6),
              fontFamily: 'Open Sans',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '09:18AM',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.grey[700],
              fontFamily: 'Open Sans',
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomRightSection() {
    return Container(
      margin: EdgeInsets.only(left: 15, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: Text(
              contact['last_message']['content'],
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.grey,
                fontFamily: 'Open Sans',
                fontSize: 14,
              ),
            ),
          ),
          // CircleAvatar(
          //   backgroundColor: Color(0xfffe6fb6),
          //   radius: 10.0,
          //   child: Text(
          //     "2",
          //     style: TextStyle(color: Colors.white, fontSize: 12.0),
          //   ),
          // ),
        ],
      ),
    );
  }
}
