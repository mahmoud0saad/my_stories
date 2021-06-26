import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konsolto_app/CommonUtils/size_config.dart';
import 'package:konsolto_app/res/colors.dart';
import 'package:konsolto_app/route/fluro_navigator.dart';
import 'package:konsolto_app/ui/home/widgets/ItemStory.dart';
import 'package:konsolto_app/ui/story_detail/story_detail_screen.dart';
import '../../network/models/StoriesResponse.dart';
import 'package:konsolto_app/ui/home/home_provider.dart';
import 'package:provider/provider.dart';

import 'home_presenter.dart';

class HomeScreenMobile extends StatelessWidget {
  final HomePresenter mPresenter;

  HomeScreenMobile(this.mPresenter);

  @override
  Widget build(BuildContext context) {
    List<Result> list =
        Provider.of<HomeProvider<StoriesResponse>>(context, listen: true)
                ?.instance
                ?.results ??
            [];
    return RefreshIndicator(
      onRefresh: _refresh,
      displacement: 60,
      child: ListView.builder(
        padding: EdgeInsets.all(8),
        scrollDirection: Axis.vertical,
        itemCount: list.length ?? 0,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return _itemStory(context, list[index]);
        },
      ),
    );
  }

  Future _refresh() async {
    mPresenter.getAllStories();
  }

  Widget _itemStory(context, Result resultItem) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StoryDetailScreen(
                  resultItem:resultItem),
            ));
        // NavigatorUtils.push(context, StoryDetailScreen.TAG,
        //     replace: true, clearStack: true);
      },
      child: ItemStory(
        mPresenter: mPresenter,
        resultItem: resultItem,
        context: context,
      ),
    );
  }
}

