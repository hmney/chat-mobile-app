import 'package:app/src/stores/authentication/authentication_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    final _authStore = AuthenticationStore();
    return MultiProvider(
      providers: [

      ],
      child: MaterialApp(
        title: 'Lover\'s Msg',
        theme: ThemeData(
            primaryColor: Color(0xfff72279),
            primaryColorLight: Color(0xfffee6f2),
            primaryColorDark: Color(0xfff49ac7),
            accentColor: Color(0xfffcfcfc),),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: Modular.generateRoute,
        navigatorKey: Modular.navigatorKey,
      ),
    );
  }
}
