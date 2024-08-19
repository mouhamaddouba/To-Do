import 'package:flutter/material.dart';
import 'package:to_do/app/core/themes/app_colors.dart';
import 'package:to_do/app/core/themes/app_themes.dart';

void showMessage(BuildContext context,
    {String message = "message", bool isError = false}) {
  if (context.mounted) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      duration: const Duration(milliseconds: 3000),
      backgroundColor: isError
          ? AppColors.red01
          : AppTheme.getAppThemeMode() == ThemeMode.dark.name
              ? AppColors.white01
              : AppColors.black01,
      content: Center(
        child: Text(message,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                fontSize: 14,
                color: AppTheme.getAppThemeMode() == ThemeMode.dark.name
                    ? AppColors.black01
                    : null)),
      ),
    ));
  }
}
