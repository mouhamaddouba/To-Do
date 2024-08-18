import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:to_do/app/core/themes/app_colors.dart';
import 'package:to_do/app/core/translations/app_strings.dart';
import 'package:to_do/app/core/values/constant/app_assets.dart';
import 'package:to_do/app/core/values/constant/app_constants.dart';
import 'package:to_do/app/core/values/constant/app_dimensions.dart';
import 'package:to_do/app/global_widgets/app_text_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    super.key,
  });

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController scaleController;
  late Animation<double> scaleAnimation;

  double opacity = 0;
  bool value = true;

  @override
  void initState() {
    delaySplash();
    super.initState();
  }

  void delaySplash() {
    scaleController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: AppConstants.duration600,
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          /// Go to another screen
          Navigator.pushReplacementNamed(
            context,
            AppRoutes.auth,
          );

          Timer(
            const Duration(
              milliseconds: AppConstants.duration300,
            ),
            () => scaleController.reset(),
          );
        }
      });

    scaleAnimation = Tween<double>(
      begin: AppConstants.tween00,
      end: AppConstants.tween30,
    ).animate(scaleController);

    Timer(
      const Duration(
        milliseconds: AppConstants.duration600,
      ),
      () {
        opacity = AppConstants.opacity01;
        value = false;
      },
    );

    Timer(
      const Duration(
        milliseconds: AppConstants.duration1800,
      ),
      () => scaleController.forward(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// Name App
          AppTextWidget(
            AppStrings.appName.tr(),
            textColor: AppColors.black01,
            fontWeight: FontWeight.bold,
            fontSize: AppDimensions.fontSize22,
          ),

          /// Spacer
          const SizedBox(
            height: AppDimensions.paddingOrMargin100,
          ),

          /// Logo
          Center(
            child: AnimatedOpacity(
              curve: Curves.fastLinearToSlowEaseIn,
              duration: const Duration(
                seconds: AppConstants.duration01,
              ),
              opacity: opacity,
              child: AnimatedContainer(
                curve: Curves.fastLinearToSlowEaseIn,
                duration: const Duration(
                  seconds: AppConstants.duration02,
                ),
                height:
                    value ? AppDimensions.height50 : AppDimensions.height200,
                width: value ? AppDimensions.width50 : AppDimensions.width200,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary,
                ),
                child: Center(
                  child: Container(
                    width: AppDimensions.width100,
                    height: AppDimensions.height100,
                    decoration: const BoxDecoration(
                      /// Logo
                      image: DecorationImage(
                        image: AssetImage(
                          AppAssets.logo,
                        ),
                      ),
                    ),
                    child: AnimatedBuilder(
                      animation: scaleAnimation,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: scaleAnimation.value,
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primary,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
