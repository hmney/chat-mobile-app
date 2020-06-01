import 'package:app/src/models/contact_model.dart';
import 'package:app/src/stores/chat/chat_store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  final ContactModel contact;

  ChatScreen({
    @required this.contact,
  }) : assert(contact != null);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ContactModel get contact => widget.contact;
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Provider.of<ChatStore>(context).getThisUid();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColorLight,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          flexibleSpace: Row(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(60, 0, 10, 0),
                child: Image.asset(
                  'assets/images/kindpng_786207.png',
                  width: 35,
                  height: 35,
                ),
              ),
              Text(
                contact?.contactDetails?.username,
                style: TextStyle(
                  color: Color(0xfffe6fb6),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontFamily: 'Open Sans',
                ),
              ),
            ],
          ),
          backgroundColor: Theme.of(context).accentColor,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
        body: chatMessages(),
      ),
    );
  }

  Widget chatMessages() {
    return Observer(
      builder: (_) => Column(
        children: <Widget>[
          Flexible(
            child: StreamBuilder(
              stream: Provider.of<ChatStore>(context)
                  .getChatMessages(contact.chatId),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  return messages(context, snapshot);
                }
                return Container();
              },
            ),
          ),
          messageTextField(),
        ],
      ),
    );
  }

  Widget messages(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    return Observer(
      builder: (_) => ListView.builder(
        padding: EdgeInsets.only(top: 8.0, left: 15.0, right: 15.0),
        itemCount: snapshot.data.documents.length,
        reverse: true,
        itemBuilder: (context, index) {
          Provider.of<ChatStore>(context)
              .setSenderUid(snapshot.data.documents[index]['sender_id']);
          return Align(
            alignment: Provider.of<ChatStore>(context).checkSenderUid
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: UnconstrainedBox(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: 300,
                ),
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: (Provider.of<ChatStore>(context).checkSenderUid)
                      ? Theme.of(context).primaryColorDark 
                      : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: Text(
                    snapshot.data.documents[index]['content'],
                    style: TextStyle(
                      fontFamily: 'Open Sans',
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget messageTextField() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      margin: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _messageController,
              onChanged: (value) =>
                  Provider.of<ChatStore>(context).setMessage(value),
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none),
                hintText: 'Type a message ...',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Open Sans',
                  fontSize: 16,
                ),
              ),
              textInputAction: TextInputAction.send,
            ),
          ),
          Container(
            width: 45,
            height: 45,
            margin: EdgeInsets.fromLTRB(0, 5, 5, 5),
            child: FloatingActionButton(
              backgroundColor: Color(0xfffe6fb6),
              onPressed: () {
                Provider.of<ChatStore>(context)
                    .postMessage(contact.chatId, _messageController.text);
                _messageController.clear();
              },
              child: Icon(
                Icons.send,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
