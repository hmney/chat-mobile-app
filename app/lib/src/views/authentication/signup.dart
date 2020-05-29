import 'package:app/src/stores/authentication/authentication_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
                controller: _usernameController,
                onChanged: (value) => Provider.of<AuthenticationStore>(context)
                    .setUsername(value),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  hintText: 'USERNAME',
                  prefixIcon: Icon(
                    Icons.person,
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                  ),
                  errorText:
                      Provider.of<AuthenticationStore>(context).error.username,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
              width: 300,
              height: 60,
              child: TextFormField(
                controller: _emailController,
                onChanged: (value) =>
                    Provider.of<AuthenticationStore>(context).setEmail(value),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  hintText: 'Email',
                  prefixIcon: Icon(
                    Icons.email,
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
                controller: _passwordController,
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
                        Provider.of<AuthenticationStore>(context).signUp();
                      },
                      color: Theme.of(context).primaryColor,
                      hoverColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        'Signup',
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
