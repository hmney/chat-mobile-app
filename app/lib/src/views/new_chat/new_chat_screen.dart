import 'package:app/routes/app_routes.dart';
import 'package:app/src/models/user_model.dart';
import 'package:app/src/repositories/chat_repository.dart';
import 'package:app/src/stores/authentication/authentication_store.dart';
import 'package:app/src/stores/chat/chat_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';

class NewChatScreen extends StatefulWidget {
  @override
  _NewChatScreenState createState() => _NewChatScreenState();
}

class _NewChatScreenState extends State<NewChatScreen> {
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'New Chat',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
            fontFamily: 'Open Sans',
          ),
        ),
        backgroundColor: Theme.of(context).accentColor,
      ),
      body: Observer(
        builder: (_) => Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(40, 65, 40, 30),
              alignment: Alignment.centerLeft,
              child: Text(
                'Add your lover email',
                style: TextStyle(
                  fontFamily: 'Open Sans',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
            ),
            Center(
              child: Container(
                width: 300,
                height: 60,
                child: TextField(
                  controller: _emailController,
                  onChanged: (value) =>
                      Provider.of<AuthenticationStore>(context).setEmail(value),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    hintText: 'EMAIL',
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                    ),
                    errorText:
                        Provider.of<AuthenticationStore>(context).error.email,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () async {
          var contact = await Provider.of<ChatStore>(context)
              .createNewContact(_emailController.value.text);
          if (contact != null)
            Modular.to.pushNamed(
              pathForRoute(APP_ROUTE.CHAT),
              arguments: contact,
            );
          else
            print('contact don\'t exist');
        },
        child: Icon(
          Icons.arrow_forward,
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.clear();
  }
}
