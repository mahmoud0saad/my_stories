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

import 'story_detail_presenter.dart';
import 'story_detail_provider.dart';
import 'story_detail_screen_mobile.dart';

class StoryDetailScreen extends StatefulWidget {
   static const String TAG = "/story_detail_screen";

  StoryDetailScreen({this.resultItem});
   Result resultItem;

  @override
  StoryDetailScreenState createState() => StoryDetailScreenState();
}

class StoryDetailScreenState extends BaseState<StoryDetailScreen, StoryDetailPresenter>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {



  @override
  void initState() {
    super.initState();

   }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    super.build(context);
    return
         Material(
          child: SafeArea(
            child: Scaffold(
              appBar: buildAppBar(context),
              body: ScreenTypeLayout(
                mobile: StoryDetailScreenMobile(mPresenter,widget.resultItem),
                desktop: StoryDetailScreenMobile(mPresenter,widget.resultItem),
              ),

            ),
          ),
        ) ;
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: MColors.primary_color,
      title: Text(S.of(context).app_name),
      centerTitle: true,
    );
  }

  @override
  StoryDetailPresenter createPresenter() {
    return StoryDetailPresenter();
  }

  @override
  bool get wantKeepAlive => true;

  bool checkPlatformIos() {
    return Platform.isIOS;
  }
}
