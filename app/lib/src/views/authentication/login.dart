import 'package:app/src/stores/authentication/authentication_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 70, 0, 20),
              width: 300,
              height: 60,
              child: TextFormField(
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
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
              width: 300,
              height: 60,
              child: TextFormField(
                onChanged: (value) => Provider.of<AuthenticationStore>(context)
                    .setPassword(value),
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  hintText: 'PASSWORD',
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                  ),
                  errorText:
                      Provider.of<AuthenticationStore>(context).error.password,
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: 300,
                    height: 54,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: RaisedButton(
                      onPressed: () {
                        Provider.of<AuthenticationStore>(context).signIn();
                      },
                      color: Theme.of(context).primaryColor,
                      hoverColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontSize: 18,
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}