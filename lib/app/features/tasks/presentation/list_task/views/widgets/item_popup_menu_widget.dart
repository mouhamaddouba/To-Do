import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:to_do/app/core/themes/app_colors.dart';
import 'package:to_do/app/core/values/constant/app_dimensions.dart';
import 'package:to_do/app/global_widgets/app_image_widget.dart';
import 'package:to_do/app/global_widgets/app_text_widget.dart';

class ItemPopupMenuWidget extends StatelessWidget {
  final String iconItem;
  final String titleItem;
  final Color? iconColor;
  final Color? titleColor;

  const ItemPopupMenuWidget({
    super.key,
    required this.iconItem,
    required this.titleItem,
    this.iconColor,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Icon item
        AppImageWidget(
          path: iconItem,
          width: AppDimensions.width16,
          height: AppDimensions.height16,
          color: iconColor ?? AppColors.black00,
        ),

        /// Space
        const SizedBox(
          width: AppDimensions.paddingOrMargin16,
        ),

        /// Title item
        AppTextWidget(
          titleItem.tr(),
          fontSize: AppDimensions.fontSize08,
          fontWeight: FontWeight.normal,
          textColor: titleColor ?? AppColors.black00,
        ),
      ],
    );
  }
}
