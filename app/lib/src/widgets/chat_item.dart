import 'package:flutter/material.dart';

class ChatItem extends StatefulWidget {
  @override
  _ChatItemState createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      width: 300,
      height: 65,
      child: Row(children: <Widget>[
        leftSection(),
        Expanded(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                topRightSection(),
                bottomRightSection(),
              ],
            ),
          ),
        )
      ]),
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
          Container(
            child: Text(
              'username',
              style: TextStyle(
                color: Color(0xfffe6fb6),
                fontFamily: 'Open Sans',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
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
      margin: EdgeInsets.only(left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: Text(
              'Mesage here is so long as fuck man what you do to ',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.grey,
                fontFamily: 'Open Sans',
                fontSize: 14,
              ),
            ),
          ),
          Container(
            child: CircleAvatar(
              backgroundColor: Color(0xfffe6fb6),
              radius: 10.0,
              child: Text(
                "2",
                style: TextStyle(color: Colors.white, fontSize: 12.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
