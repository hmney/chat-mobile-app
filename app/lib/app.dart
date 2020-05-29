import 'package:app/src/stores/authentication/authentication_store.dart';
import 'package:app/src/views/get_started_screen.dart';
import 'package:app/src/views/home_screen.dart';
import 'package:app/src/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  AuthenticationStore authStore;
  void initState() {
    super.initState();
    authStore = AuthenticationStore();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationStore>.value(value: authStore),
      ],
      child: MaterialApp(
        title: 'Lover\'s Msg',
        theme: ThemeData(
          primaryColor: Color(0xfff72279),
          primaryColorLight: Color(0xfffee6f2),
          primaryColorDark: Color(0xfff49ac7),
          accentColor: Color(0xfffcfcfc),
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Modular.generateRoute,
        navigatorKey: Modular.navigatorKey,
        home: SplashScreen(),
      ),
    );
  }
}
