import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do/app/core/themes/app_colors.dart';
import 'package:to_do/app/core/translations/app_strings.dart';
import 'package:to_do/app/core/values/constant/app_constants.dart';
import 'package:to_do/app/core/values/constant/app_dimensions.dart';
import 'package:to_do/app/global_widgets/app_icon_widget.dart';
import 'package:to_do/app/global_widgets/app_text_field_widget.dart';

class AuthFieldView extends StatefulWidget {
  const AuthFieldView({super.key});

  @override
  State<AuthFieldView> createState() => _AuthFieldViewState();
}

class _AuthFieldViewState extends State<AuthFieldView> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// User Name
        AppTextFieldWidget(
          textController: userNameController,
          verticalPadding: AppDimensions.paddingOrMargin14,
          backgroundColor: AppColors.background,
          hintText: AppStrings.userName.tr(),
          textColor: AppColors.gray03,
          fontSize: AppDimensions.fontSize10,
        ),

        /// Space
        const SizedBox(
          height: AppDimensions.paddingOrMargin16,
        ),

        /// Password
        AppTextFieldWidget(
          textController: passwordController,
          backgroundColor: Theme.of(context).brightness == Brightness.light
              ? AppColors.onPrimary
              : AppColors.darkOnPrimary,
          verticalPadding: AppDimensions.paddingOrMargin14,
          textColor: Theme.of(context).brightness == Brightness.light
              ? AppColors.black01
              : AppColors.whiteBlue,
          hintText: AppStrings.password.tr(),
          textInputAction: TextInputAction.done,
          horizontalPadding: AppDimensions.paddingOrMargin16,
          maxLines: AppConstants.maxLines,
          fontSize: AppDimensions.fontSize10,
          obscureText: !showPassword,
          suffixIcon: AppIconWidget(
            color: Theme.of(context).brightness == Brightness.light
                ? AppColors.gray03
                : AppColors.darkPrimary,
            iconData:
                showPassword ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
            onTap: () {
              setState(() {
                showPassword = !showPassword;
              });
            },
          ),
        ),
      ],
    );
  }
}
