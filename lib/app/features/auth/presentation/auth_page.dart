import 'package:flutter/material.dart';
import 'package:to_do/app/core/values/constant/app_assets.dart';
import 'package:to_do/app/core/values/constant/app_dimensions.dart';
import 'package:to_do/app/features/auth/presentation/views/auth_form_view.dart';
import 'package:to_do/app/global_widgets/app_image_widget.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final loginFormKey = GlobalKey<FormState>();

    return Scaffold(
      body: Column(
        children: [
          /// Header
          SizedBox(
            width: double.infinity,
            height: size.height * 0.3,
            child: const AppImageWidget(
              path: AppAssets.logInToDo,
            ),
          ),

          /// Form
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(
                    AppDimensions.radius25,
                  ),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: loginFormKey,
                  child: const AuthFormView(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
