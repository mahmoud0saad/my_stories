import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konsolto_app/CommonUtils/size_config.dart';
import 'package:konsolto_app/network/models/StoriesResponse.dart';
import 'package:konsolto_app/res/colors.dart';

import '../home_presenter.dart';

class ItemStory extends StatelessWidget {
  const ItemStory({
    Key key,
    this.mPresenter,
    this.resultItem,
    this.context,
  }) : super(key: key);
  final HomePresenter mPresenter;

  final Result resultItem;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: SizeConfig.screenWidth * .02,
          horizontal: SizeConfig.screenWidth * .02),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: MColors.white),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          buildImageOfAd(
            resultItem?.multimedia?.first?.url ?? "",
          ),
          _buildStoryDetail(resultItem, context)
        ],
      ),
    );
  }

  ListTile _buildStoryDetail(Result resultItem, context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      title: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          resultItem.title,
          style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 14),
          maxLines: 1,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          resultItem.resultAbstract,
          style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 12),
          maxLines: 2,
        ),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            mPresenter.getDateFormat(resultItem.createdDate),
            style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 10),
            maxLines: 1,
          ),
          Text(
            mPresenter.getDateFormat(resultItem.publishedDate),
            style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 10),
            maxLines: 1,
          )
        ],
      ),
    );
  }

  Container buildImageOfAd(String imageUrl) {
    return Container(
      height: SizeConfig.screenHeight * .2,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        child: CachedNetworkImage(
          fit: BoxFit.fitWidth,
          useOldImageOnUrlChange: true,
          memCacheHeight: 600,
          memCacheWidth: 600,
          imageUrl: imageUrl,
          placeholder: (context, url) => _createPlaceHolder(context),
        ),
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
