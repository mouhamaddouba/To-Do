import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:to_do/app/core/themes/app_colors.dart';
import 'package:to_do/app/core/translations/app_strings.dart';
import 'package:to_do/app/features/auth/presentation/views/auth_field_view.dart';
import 'package:to_do/app/global_widgets/app_button_widget.dart';
import 'package:to_do/app/global_widgets/app_text_widget.dart';

class AuthFormView extends StatelessWidget {
  const AuthFormView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Space
        const SizedBox(
          height: 10,
        ),

        /// LogIn Text
        AppTextWidget(
          AppStrings.applySettings.tr(),
          textColor: AppColors.black01,
        ),

        /// Space
        const SizedBox(
          height: 10,
        ),

        /// TextFiled
        const AuthFieldView(),

        /// Space
        const SizedBox(
          height: 10,
        ),

        /// Button LogIn
        AppButtonWidget(
          text: AppStrings.applySettings.tr(),
          onPressed: () {},
          color: AppColors.primary,
        ),
      ],
    );
  }
}
