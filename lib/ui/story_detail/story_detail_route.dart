
import 'package:fluro/fluro.dart';
import 'package:konsolto_app/route/router_init.dart';

import 'story_detail_screen.dart';


class LoginRouter implements IRouterProvider {
  static String StoryDetailPage = StoryDetailScreen.TAG;

  @override
  void initRouter(FluroRouter router) {
    router.define(StoryDetailPage,
        handler: Handler(handlerFunc: (_, params) => StoryDetailScreen()));
  }
}
