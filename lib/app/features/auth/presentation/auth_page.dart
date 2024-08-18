import 'package:flutter/material.dart';
import 'package:to_do/app/core/themes/app_colors.dart';
import 'package:to_do/app/core/values/constant/app_assets.dart';
import 'package:to_do/app/core/values/constant/app_dimensions.dart';
import 'package:to_do/app/features/auth/presentation/views/auth_form_view.dart';
import 'package:to_do/app/global_widgets/app_image_widget.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundSplash,
      body: Column(
        children: [
          /// Header
          SizedBox(
            width: double.infinity,
            height: size.height * 0.4,
            child: const AppImageWidget(
              path: AppAssets.logInToDo,
            ),
          ),

          /// Form
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.white01,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(
                    AppDimensions.radius25,
                  ),
                ),
              ),
              padding: const EdgeInsets.all(
                AppDimensions.paddingOrMargin16,
              ),
              child: const SingleChildScrollView(
                child: AuthFormView(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
