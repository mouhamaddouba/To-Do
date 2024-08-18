import 'package:flutter/material.dart';
import 'package:to_do/app/core/values/constant/app_assets.dart';
import 'package:to_do/app/core/values/constant/app_dimensions.dart';
import 'package:to_do/app/global_widgets/app_image_widget.dart';
import 'package:to_do/app/global_widgets/app_text_widget.dart';

class AppNoDataFoundWidget extends StatelessWidget {
  final double? widthImage;
  final double? space;
  final String title;
  final MainAxisAlignment? mainAxisAlignment;

  const AppNoDataFoundWidget({
    super.key,
    this.widthImage,
    this.space,
    required this.title,
    this.mainAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.end,
      children: [
        AppImageWidget(
          path: AppAssets.emptyImage,
          width: widthImage ?? AppDimensions.width160,
        ),
        SizedBox(
          height: space ?? AppDimensions.height40,
        ),
        AppTextWidget(
          title,
          textStyle: Theme.of(context).textTheme.displaySmall,
        ),
      ],
    );
  }
}
