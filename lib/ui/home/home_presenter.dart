import 'package:intl/intl.dart';
import 'package:konsolto_app/base/presenter/base_presenter.dart';
import '../../network/models/StoriesResponse.dart';
import 'package:konsolto_app/network/api/network_api.dart';
import 'package:konsolto_app/network/network_util.dart';
import 'package:konsolto_app/ui/home/home_provider.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

class HomePresenter extends BasePresenter<HomeScreenState> {
  Future getAllStories() async {
    // view.showProgress();

    requestFutureData<StoriesResponse>(Method.get,
        params: headers, url: Api.fetchStories, onSuccess: (data) {
      // view.closeProgress();
          print("onSuccess in api request ${data?.toJson()}");

          if (data?.results != null && data.results.isNotEmpty)
            Provider.of<HomeProvider<StoriesResponse>>(view.context, listen: false)
                .setData(data);
    }, onError: (code, msg) {
      print("error in api request $msg");
      // view.closeProgress();
    });
  }

  String getDateFormat(DateTime publishedDate) {
    final f = new DateFormat('yyyy-MM-dd hh:mm');

    return f.format(publishedDate);

  }
}
