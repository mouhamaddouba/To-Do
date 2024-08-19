import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/app.dart';
import 'package:to_do/app/core/translations/localization/app_translations.dart';
import 'package:to_do/app/core/utils/app_prefs_utils.dart';

import 'app/core/di/di.dart';

Future<void> main() async {
  /// Inject widget app
  WidgetsFlutterBinding.ensureInitialized();

  /// Init translation library
  await EasyLocalization.ensureInitialized();

  /// Set screen on horizontal mode
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  /// Set setup to chrome system
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [],
  );

  await AppPrefs().init();

  await initAppModule();

  /// Make system chrome in dark mode
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark,
  );

  runApp(
    /// Translations
    EasyLocalization(
      path: assetPathLocalization,
      supportedLocales: const [englishLocal],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, widget) {
          return const App();
        },
      ),
    ),
  );
}
