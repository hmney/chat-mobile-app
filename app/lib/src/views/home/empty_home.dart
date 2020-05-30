import 'package:flutter/material.dart';

class EmptyHome extends StatefulWidget {
  @override
  _EmptyHomeState createState() => _EmptyHomeState();
}

class _EmptyHomeState extends State<EmptyHome> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Image.asset('assets/images/undraw_add_content_d1tf.png'),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30, bottom: 10),
            child: Text(
              'You don\'t have any contacts',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Open Sans',
              ),
            ),
          ),
          Container(
            width: 230,
            alignment: Alignment.center,
            child: Text(
              'you can add some friends from the button bellow',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    );
  }
}
