import 'package:konsolto_app/base/provider/base_list_provider.dart';
import 'package:konsolto_app/base/provider/base_provider.dart';

class HomeProvider<T> extends BaseProvider<T> {
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
  }
}
