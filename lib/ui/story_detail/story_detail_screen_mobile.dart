import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konsolto_app/CommonUtils/size_config.dart';
import 'package:konsolto_app/res/colors.dart';
import 'package:konsolto_app/ui/story_detail/story_detail_provider.dart';
import '../../network/models/StoriesResponse.dart';
import 'package:provider/provider.dart';

import 'story_detail_presenter.dart';

class StoryDetailScreenMobile extends StatelessWidget {
  final StoryDetailPresenter mPresenter;

  StoryDetailScreenMobile(this.mPresenter, this.resultItem);
  final Result resultItem;
  @override
  Widget build(BuildContext context) {
     return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Text(
            resultItem?.title??"",
            style: Theme.of(context).textTheme.headline5 ,
          ),
          Text(
            resultItem?.resultAbstract??"",
            style: Theme.of(context).textTheme.bodyText2 ,
          ),
          buildImageOfAd(
            resultItem?.multimedia?.first?.url ?? "",
          ),
          Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: Text(
              resultItem.createdDate.toString(),
              style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }




  Container buildImageOfAd(String imageUrl) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: CachedNetworkImage(
        fit: BoxFit.fill,
        useOldImageOnUrlChange: true,
        imageUrl: imageUrl,
        placeholder: (context, url) => _createPlaceHolder(context),
      ),
    );
  }

  Widget _createPlaceHolder(BuildContext context) {
    return Container(
      color: MColors.secondary_light_color,
      constraints: BoxConstraints.expand(),
      child: FittedBox(
        child: Icon(
          Icons.image,
          color: Colors.white,
        ),
      ),
    );
  }
}
