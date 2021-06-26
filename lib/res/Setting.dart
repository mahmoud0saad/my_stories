import 'package:flutter/cupertino.dart';

class Setting {
  static ValueNotifier<Locale> mobileLanguage =
      new ValueNotifier(Locale('en', ''));
  Setting();
}
