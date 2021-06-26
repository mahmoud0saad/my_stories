import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konsolto_app/CommonUtils/size_config.dart';
import 'package:konsolto_app/base/view/base_state.dart';
import 'package:konsolto_app/generated/l10n.dart';
import '../../network/models/StoriesResponse.dart';
import 'package:konsolto_app/res/colors.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'home_presenter.dart';
import 'home_provider.dart';
import 'home_screen_mobile.dart';
import 'home_screen_web.dart';

class HomeScreen extends StatefulWidget {
  static const String TAG = "/home";

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends BaseState<HomeScreen, HomePresenter>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    mPresenter.getAllStories();
  }

  HomeProvider homeProvider = HomeProvider<StoriesResponse>();

  @override
  void dispose() {
    super.dispose();
  }

  BuildContext providerContext;

  @override
  Widget build(BuildContext context2) {
    print(" mano  width is ${SizeConfig.screenWidth}");
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(context),
        body: ScreenTypeLayout(
          mobile: HomeScreenMobile(mPresenter),
          desktop: HomeScreenWeb(mPresenter),
          tablet: HomeScreenWeb(mPresenter),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: MColors.primary_color,
      title: Text(S.of(context).app_name),
      centerTitle: true,
    );
  }

  @override
  HomePresenter createPresenter() {
    return HomePresenter();
  }

  @override
  bool get wantKeepAlive => true;

  bool checkPlatformIos() {
    return Platform.isIOS;
  }
}
