import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:to_do/app/core/values/constant/app_dimensions.dart';
import 'package:to_do/app/global_widgets/app_image_widget.dart';
import 'package:to_do/app/global_widgets/app_text_widget.dart';

class ItemPopupMenuWidget extends StatelessWidget {
  final String iconItem;
  final String titleItem;

  const ItemPopupMenuWidget({
    super.key,
    required this.iconItem,
    required this.titleItem,
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
        ),
      ],
    );
  }
}
