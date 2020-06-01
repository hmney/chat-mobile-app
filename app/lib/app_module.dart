import 'package:app/app.dart';
import 'package:app/routes/app_routes.dart';
import 'package:app/src/views/authentication/authentication_screen.dart';
import 'package:app/src/views/chat_screen/chat_screen.dart';
import 'package:app/src/views/get_started/get_started_screen.dart';
import 'package:app/src/views/home/home_screen.dart';
import 'package:app/src/views/new_chat/new_chat_screen.dart';
import 'package:app/src/views/splash/splash_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
    Router(
      pathForRoute(APP_ROUTE.SPLASH_SCREEN),
      child: (_, args) => SplashScreen(),
    ),
    Router(
      pathForRoute(APP_ROUTE.GET_STARTED),
      child: (_, args) => GetStartedScreen(),
    ),
    Router(
      pathForRoute(APP_ROUTE.AUTHENTICATION),
      child: (_, args) => AuthenticationScreen(),
    ),
    Router(
      pathForRoute(APP_ROUTE.HOME),
      child: (_, args) => HomeScreen(),
    ),
    Router(
      pathForRoute(APP_ROUTE.NEW_CHAT),
      child: (_, args) => NewChatScreen(),
    ),
    Router(
      pathForRoute(APP_ROUTE.CHAT),
      child: (_, args) => ChatScreen(contact: args.data),
    )
  ];

  @override
  Widget get bootstrap => App();
}