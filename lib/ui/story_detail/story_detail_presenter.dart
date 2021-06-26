import 'package:intl/intl.dart';
import 'package:konsolto_app/base/presenter/base_presenter.dart';
import 'package:konsolto_app/network/api/network_api.dart';
import 'package:konsolto_app/network/network_util.dart';
 import 'package:provider/provider.dart';

import '../../network/models/StoriesResponse.dart';
import 'story_detail_screen.dart';

class StoryDetailPresenter extends BasePresenter<StoryDetailScreenState> {
  Future getAllStories() async {
    // view.showProgress();

  }

  String getDateFormat(DateTime publishedDate) {
    final f = new DateFormat('yyyy-MM-dd hh:mm');

    return f.format(publishedDate);

  }
}
