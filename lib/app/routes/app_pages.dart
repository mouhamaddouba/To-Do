import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:to_do/app/core/translations/app_strings.dart';

class AppPages {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
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
