import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:konsolto_app/generated/l10n.dart';
import 'package:konsolto_app/res/Setting.dart';
import 'package:konsolto_app/res/colors.dart';
import 'package:konsolto_app/route/application.dart';
import 'package:konsolto_app/route/routers.dart';
import 'package:konsolto_app/ui/home/home_provider.dart';
import 'package:konsolto_app/ui/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

import 'network/models/StoriesResponse.dart';

Future<void> main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp() {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Setting.mobileLanguage,
      builder: (context, Locale local, _) {
        return ChangeNotifierProvider<HomeProvider<StoriesResponse>>(
          create: (_) => HomeProvider<StoriesResponse>(),
          child: MaterialApp(
            locale: local,
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            title: "Stories",
            theme: ThemeData(
                hintColor: MColors.hint_color,
                primaryColor: MColors.primary_color,
                fontFamily: "Tajawal"),
            home: SplashScreen(),
            // home: SplashScreen(),
          ),
        );
      },
    );
  }
}
