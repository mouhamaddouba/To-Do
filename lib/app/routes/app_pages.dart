import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:to_do/app/core/translations/app_strings.dart';
import 'package:to_do/app/features/splash/presentation/splash_page.dart';
import 'package:to_do/app/routes/app_routes.dart';

class AppPages {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
        );
    }
    return MaterialPageRoute(
      builder: (BuildContext context) {
        return Scaffold(
          body: Center(
            child: Text('${AppStrings.piecesInEachKit.tr()}${settings.name}.'),
          ),
        );
      },
    );
  }
}
