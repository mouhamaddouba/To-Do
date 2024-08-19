import 'package:flutter/material.dart';
import 'package:to_do/app/core/themes/app_colors.dart';
import 'package:to_do/app/core/values/constant/app_assets.dart';
import 'package:to_do/app/core/values/constant/app_constants.dart';
import 'package:to_do/app/core/values/constant/app_dimensions.dart';
import 'package:to_do/app/global_widgets/app_image_widget.dart';
import 'package:to_do/app/global_widgets/app_text_widget.dart';

class AppNoDataFoundWidget extends StatelessWidget {
  final double? widthImage;
  final double? space;
  final String title;
  final String? content;
  final MainAxisAlignment? mainAxisAlignment;

  const AppNoDataFoundWidget({
    super.key,
    this.widthImage,
    this.space,
    required this.title,
    this.content,
    this.mainAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.end,
      children: [
        /// Image
        AppImageWidget(
          path: AppAssets.logo,
          width: widthImage ?? AppDimensions.width160,
        ),

        /// Space
        SizedBox(
          height: space ?? AppDimensions.height40,
        ),

        /// Title big
        AppTextWidget(
          title,
          fontWeight: FontWeight.w600,
          textAlign: TextAlign.center,
          fontSize: AppDimensions.fontSize14,
        ),

        /// Content
        AppTextWidget(
          title,
          fontWeight: FontWeight.normal,
          textAlign: TextAlign.center,
          fontSize: AppDimensions.fontSize10,
          textColor: AppColors.black00.withOpacity(
            AppConstants.opacity0_6,
          ),
        ),
      ],
    );
  }
}
