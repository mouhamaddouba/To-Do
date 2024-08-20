import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/app/core/themes/app_themes.dart';
import 'package:to_do/app/core/translations/app_strings.dart';
import 'package:to_do/app/features/tasks/presentation/blocs/tasks_bloc.dart';
import 'package:to_do/app/routes/app_pages.dart';
import 'package:to_do/app/routes/app_routes.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => TasksBloc()
              ..add(
                FetchTaskEvent(),
              )),
      ],
      child: MaterialApp(
        /// Cancel check marker in corner
        debugShowCheckedModeBanner: false,

        /// App name
        title: AppStrings.appName,

        /// Routing
        onGenerateRoute: AppPages.generateRoutes,
        initialRoute: AppRoutes.splash,

        /// Theme
        theme: AppTheme.getAppTheme(),

        /// Locale
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,

        /// Response
        builder: (context, child) {
          final MediaQueryData data = MediaQuery.of(context);
          return MediaQuery(
            data: data.copyWith(
              textScaler: const TextScaler.linear(1),
            ),
            child: child!,
          );
        },
      ),
    );
  }
}
