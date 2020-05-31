import 'package:app/src/stores/authentication/authentication_store.dart';
import 'package:app/src/stores/chat/chat_store.dart';
import 'package:app/src/views/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  AuthenticationStore authStore;
  ChatStore chatStore;

  void initState() {
    super.initState();
    authStore = AuthenticationStore();
    chatStore = ChatStore();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationStore>.value(value: authStore),
        Provider<ChatStore>.value(value: chatStore),
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
