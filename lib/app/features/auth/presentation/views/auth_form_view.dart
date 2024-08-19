import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:to_do/app/core/themes/app_colors.dart';
import 'package:to_do/app/core/translations/app_strings.dart';
import 'package:to_do/app/core/values/constant/app_dimensions.dart';
import 'package:to_do/app/features/auth/presentation/views/auth_field_view.dart';
import 'package:to_do/app/global_widgets/app_button_widget.dart';
import 'package:to_do/app/global_widgets/app_text_widget.dart';
import 'package:to_do/app/routes/app_routes.dart';

class AuthFormView extends StatelessWidget {
  const AuthFormView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final loginFormKey = GlobalKey<FormState>();

    return Form(
      key: loginFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Space
          const SizedBox(
            height: AppDimensions.paddingOrMargin10,
          ),

          /// LogIn Text
          AppTextWidget(
            AppStrings.loginWelcome.tr(),
            textColor: AppColors.black01,
            fontWeight: FontWeight.w500,
          ),

          /// Space
          const SizedBox(
            height: AppDimensions.paddingOrMargin32,
          ),

          /// TextFiled
          const AuthFieldView(),

          /// Space
          const SizedBox(
            height: AppDimensions.paddingOrMargin16,
          ),

          /// Button LogIn
          AppButtonWidget(
            color: AppColors.primary,
            text: AppStrings.login.tr(),
            onPressed: () {
              Navigator.pushNamed(
                context,
                AppRoutes.listTask,
              );
            },
          ),
        ],
      ),
    );
  }
}
