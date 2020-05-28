import 'package:app/src/stores/authentication/authentication_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthenticationScreen extends StatefulWidget {
  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          backgroundColor: Theme.of(context).accentColor,
          body: Column(
            children: <Widget>[
              Center(
                child: Container(
                  width: 75,
                  height: 75,
                  padding: EdgeInsets.all(8.0),
                  margin: EdgeInsets.all(45),
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: Offset(0, 3),
                        blurRadius: 8,
                      )
                    ],
                  ),
                  child: SvgPicture.asset('assets/images/PinkHeart.svg'),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 2),
                        blurRadius: 5),
                  ],
                ),
                child: TabBar(
                  unselectedLabelColor:
                      Theme.of(context).primaryColor.withOpacity(0.5),
                  labelColor: Theme.of(context).primaryColor,
                  labelStyle: TextStyle(
                    fontFamily: 'Open Sans',
                    fontSize: 24,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                  indicatorColor: Theme.of(context).primaryColor,
                  indicatorWeight: 4,
                  tabs: <Widget>[
                    Tab(
                      text: 'Login',
                    ),
                    Tab(
                      text: 'Signup',
                    )
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    Login(),
                    Signup(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, 70, 0, 20),
            width: 300,
            height: 60,
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                hintText: 'EMAIL',
                prefixIcon: Icon(
                  Icons.mail,
                  color: Theme.of(context).primaryColor.withOpacity(0.5),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
            width: 300,
            height: 60,
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                hintText: 'PASSWORD',
                prefixIcon: Icon(
                  Icons.lock,
                  color: Theme.of(context).primaryColor.withOpacity(0.5),
                ),
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
                    onPressed: () {},
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
    );
  }
}

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthenticationStore _authStore = AuthenticationStore();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, 70, 0, 20),
            width: 300,
            height: 60,
            child: Observer(
              builder: (_) => TextFormField(
                controller: _usernameController,
                onChanged: (value) => _authStore.setUsername(value),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  hintText: 'USERNAME',
                  prefixIcon: Icon(
                    Icons.person,
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                  ),
                  errorText: _authStore.error.username,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
            width: 300,
            height: 60,
            child: Observer(
              builder: (_) => TextFormField(
                controller: _emailController,
                onChanged: (value) => _authStore.setEmail(value),
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
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
            width: 300,
            height: 60,
            child: Observer(
              builder: (_) => TextFormField(
                controller: _passwordController,
                onChanged: (value) => _authStore.setPassword(value),
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
                ),
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
                  child: Observer(
                    builder: (_) => RaisedButton(
                      onPressed: () {
                        _authStore.signUp();
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
            ),
          )
        ],
      ),
    );
  }
}
