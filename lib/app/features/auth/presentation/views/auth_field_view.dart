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
  final TextEditingController userNameController;
  final TextEditingController passwordController;

  const AuthFieldView({
    super.key,
    required this.userNameController,
    required this.passwordController,
  });

  @override
  State<AuthFieldView> createState() => _AuthFieldViewState();
}

class _AuthFieldViewState extends State<AuthFieldView> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// User Name
        AppTextFieldWidget(
          textColor: AppColors.gray03,
          height: AppDimensions.height80,
          hintText: AppStrings.userName.tr(),
          fontSize: AppDimensions.fontSize10,
          backgroundColor: AppColors.background,
          textController: widget.userNameController,
          verticalPadding: AppDimensions.paddingOrMargin14,
          validator: (text) {
            if (text == null || text.isEmpty) {
              return AppStrings.userNameRequired.tr();
            }
            return null;
          },
        ),

        /// Password
        AppTextFieldWidget(
          height: AppDimensions.height80,
          textController: widget.passwordController,
          backgroundColor: AppColors.onPrimary,
          verticalPadding: AppDimensions.paddingOrMargin14,
          textColor: AppColors.black01,
          hintText: AppStrings.password.tr(),
          textInputAction: TextInputAction.done,
          horizontalPadding: AppDimensions.paddingOrMargin16,
          maxLines: AppConstants.maxLines,
          fontSize: AppDimensions.fontSize10,
          obscureText: !showPassword,
          validator: (text) {
            if (text == null || text.isEmpty) {
              return AppStrings.passwordRequired.tr();
            }
            if (text.length < 8) {
              return AppStrings.passwordShorts.tr();
            }
            return null;
          },
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
