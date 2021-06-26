
import 'package:fluro/fluro.dart';
import 'package:konsolto_app/route/router_init.dart';

import 'home_screen.dart';


class LoginRouter implements IRouterProvider {
  static String homePage = HomeScreen.TAG;

  @override
  void initRouter(FluroRouter router) {
    router.define(homePage,
        handler: Handler(handlerFunc: (_, params) => HomeScreen()));
  }
}
