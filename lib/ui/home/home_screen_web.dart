import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:konsolto_app/CommonUtils/size_config.dart';
import 'package:konsolto_app/network/models/StoriesResponse.dart';
import 'package:konsolto_app/ui/home/widgets/ItemStory.dart';
import 'package:konsolto_app/ui/story_detail/story_detail_screen.dart';
import 'package:provider/provider.dart';

import 'home_presenter.dart';
import 'home_provider.dart';

class HomeScreenWeb extends StatelessWidget {
  final HomePresenter mPresenter;

  HomeScreenWeb(this.mPresenter);

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
      child: GridView.builder(

        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 300,
        ),
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
        Navigator.of(context).push(MaterialPageRoute(builder:(context)=> StoryDetailScreen(resultItem:resultItem)));
      },
      child: ItemStory(
        mPresenter: mPresenter,
        resultItem: resultItem,
        context: context,
      ),
    );
  }
}
