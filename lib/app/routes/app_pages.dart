import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:to_do/app/core/translations/app_strings.dart';
import 'package:to_do/app/features/auth/presentation/auth_page.dart';
import 'package:to_do/app/features/splash/presentation/splash_page.dart';
import 'package:to_do/app/features/tasks/presentation/list_task/list_task_page.dart';
import 'package:to_do/app/routes/app_routes.dart';

class AppPages {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
        );

      case AppRoutes.auth:
        return MaterialPageRoute(
          builder: (_) => const AuthPage(),
        );

      case AppRoutes.listTask:
        return MaterialPageRoute(
          builder: (_) => const ListTaskPage(),
        );
    }
    return MaterialPageRoute(
      builder: (BuildContext context) {
        return Scaffold(
          body: Center(
            child: Text('${AppStrings.login.tr()}${settings.name}.'),
          ),
        );
      },
    );
  }
}
