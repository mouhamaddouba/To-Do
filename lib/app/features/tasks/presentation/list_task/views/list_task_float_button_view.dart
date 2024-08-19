import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:to_do/app/core/themes/app_colors.dart';
import 'package:to_do/app/core/values/constant/app_constants.dart';
import 'package:to_do/app/core/values/constant/app_dimensions.dart';
import 'package:to_do/app/global_widgets/app_icon_widget.dart';
import 'package:to_do/app/routes/app_routes.dart';

class ListTaskFloatButtonView extends StatelessWidget {
  const ListTaskFloatButtonView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Hero(
      tag: AppConstants.heroFloatingButton,
      child: SizedBox(
        height: w / AppDimensions.height3_7,
        width: w / AppDimensions.width06,
        child: Animator<double>(
          duration: const Duration(
            milliseconds: AppConstants.duration1500,
          ),
          cycles: AppConstants.duration00,
          curve: Curves.easeInOut,
          tween: Tween<double>(
            begin: AppConstants.tween00,
            end: AppConstants.tween10,
          ),
          builder: (context, animatorState, child) {
            return Column(
              children: [
                /// height the icon animate up and down
                SizedBox(
                  height: animatorState.value * AppDimensions.height04,
                ),
                Container(
                  /// Shadow about icon
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        offset: AppConstants.offset05,
                        blurRadius: AppDimensions.radius20,
                        color: AppColors.primary.withOpacity(
                          AppConstants.opacity0_15,
                        ),
                      ),
                    ],
                  ),

                  /// Icon
                  child: AppIconWidget(
                    color: AppColors.primary,
                    iconData: Icons.add_circle,
                    size: AppDimensions.iconSize70,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.entryManager,
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
