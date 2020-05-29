import 'dart:async';

import 'package:app/routes/app_routes.dart';
import 'package:app/src/stores/authentication/authentication_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AuthenticationStore _authStore;

  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() {
    var _duration = Duration(milliseconds: 5000);
    return Timer(_duration, navigate);
  }

  navigate() {
    _authStore = Provider.of<AuthenticationStore>(context);
    if (_authStore.status == Status.Authenticated) {
      Modular.to.pushNamedAndRemoveUntil(
        pathForRoute(APP_ROUTE.HOME),
        (_) => false,
      );
    } else {
      Modular.to.pushNamedAndRemoveUntil(
        pathForRoute(APP_ROUTE.GET_STARTED),
        (_) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: SvgPicture.asset('assets/images/SplashScreenLogo.svg'),
      ),
    );
  }
}
