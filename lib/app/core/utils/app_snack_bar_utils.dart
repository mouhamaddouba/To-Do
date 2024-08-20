import 'package:flutter/material.dart';
import 'package:to_do/app/core/themes/app_colors.dart';
import 'package:to_do/app/core/themes/app_themes.dart';
import 'package:to_do/app/core/values/constant/app_constants.dart';
import 'package:to_do/app/core/values/constant/app_dimensions.dart';
import 'package:to_do/app/global_widgets/app_text_widget.dart';

void appSnackBarUtils(
  BuildContext context, {
  String message = "message",
  bool isError = false,
}) {
  if (context.mounted) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              AppDimensions.radius05,
            ),
          ),
        ),
        duration: const Duration(
          milliseconds: AppConstants.duration3000,
        ),
        backgroundColor: isError
            ? AppColors.red01
            : AppTheme.getAppThemeMode() == ThemeMode.dark.name
                ? AppColors.white01
                : AppColors.black01,
        content: Center(
          child: AppTextWidget(
            message,
            textStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontSize: AppDimensions.fontSize08,
                  color: AppTheme.getAppThemeMode() == ThemeMode.dark.name
                      ? AppColors.black01
                      : null,
                ),
          ),
        ),
      ),
    );
  }
}
