import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/app/core/themes/app_colors.dart';
import 'package:to_do/app/core/translations/app_strings.dart';
import 'package:to_do/app/core/utils/app_message.dart';
import 'package:to_do/app/core/values/constant/app_dimensions.dart';
import 'package:to_do/app/features/auth/presentation/blocs/auth_bloc.dart';
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
    final TextEditingController userNameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
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
          AuthFieldView(
            userNameController: userNameController,
            passwordController: passwordController,
          ),

          /// Space
          const SizedBox(
            height: AppDimensions.paddingOrMargin16,
          ),

          /// Button LogIn
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthLoaded) {
                Navigator.pushReplacementNamed(
                  context,
                  AppRoutes.home,
                );
              }
              if (state is AuthLoadError) {
                showMessage(context,
                    message: state.failure.message, isError: true);
              }
            },
            builder: (context, state) {
              if (state is AuthLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return AppButtonWidget(
                color: AppColors.primary,
                text: AppStrings.login.tr(),
                onPressed: () {
                  if (loginFormKey.currentState!.validate()) {
                    BlocProvider.of<AuthBloc>(context).add(Login(
                        username: userNameController.text,
                        password: passwordController.text));
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
