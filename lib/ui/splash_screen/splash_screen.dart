import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konsolto_app/CommonUtils/size_config.dart';
import 'package:konsolto_app/base/view/base_state.dart';
import 'package:konsolto_app/generated/l10n.dart';
import 'package:konsolto_app/network/models/StoriesResponse.dart';
import 'package:konsolto_app/res/colors.dart';
import 'package:konsolto_app/route/fluro_navigator.dart';
import 'package:konsolto_app/ui/home/home_provider.dart';
import 'package:konsolto_app/ui/home/home_route.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

import 'splash_presenter.dart';
import 'splash_provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends BaseState<SplashScreen, SplashPresenter>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  SplashProvider mProvider = SplashProvider();

  StreamSubscription _subscription;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return buildSplachWidget(context);
  }

  Widget buildSplachWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: MColors.primary_color,
      body: Stack(
        children: <Widget>[
          Align(
            alignment: FractionalOffset.center,
            child: Text(
              S.of(context).app_name,
              style: Theme.of(context).textTheme.headline1.copyWith(
                  color: MColors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _initSplash();
  }

  void _initSplash() {
    _subscription = Stream.value(1).delay(Duration(seconds: 1)).listen((_) {
      _openHomeScreen(context);
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (_subscription != null) {
      _subscription.cancel();
    }
  }

  @override
  SplashPresenter createPresenter() {
    return SplashPresenter();
  }

  _openHomeScreen(context) {
    NavigatorUtils.push(context, LoginRouter.homePage,
        replace: true, clearStack: true);
  }

  @override
  bool get wantKeepAlive => true;
}
