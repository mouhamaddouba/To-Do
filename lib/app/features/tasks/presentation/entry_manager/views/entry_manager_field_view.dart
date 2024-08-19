import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:to_do/app/core/themes/app_colors.dart';
import 'package:to_do/app/core/translations/app_strings.dart';
import 'package:to_do/app/core/values/constant/app_constants.dart';
import 'package:to_do/app/core/values/constant/app_dimensions.dart';
import 'package:to_do/app/global_widgets/app_text_field_widget.dart';
import 'package:to_do/app/global_widgets/app_text_widget.dart';

class EntryManagerFieldView extends StatelessWidget {
  const EntryManagerFieldView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimensions.paddingOrMargin16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title
          AppTextWidget(
            AppStrings.title.tr(),
            fontWeight: FontWeight.bold,
            fontSize: AppDimensions.fontSize10,
          ),

          /// Space
          const SizedBox(
            height: AppDimensions.paddingOrMargin8,
          ),

          /// Title text field
          AppTextFieldWidget(
            textController: titleController,
            backgroundColor: AppColors.onPrimary,
            verticalPadding: AppDimensions.paddingOrMargin14,
            horizontalPadding: AppDimensions.paddingOrMargin16,
            textColor: AppColors.gray03,
            hintText: AppStrings.taskTitle.tr(),
            textInputAction: TextInputAction.done,
            maxLines: AppConstants.maxLines,
            fontSize: AppDimensions.fontSize10,
          ),

          /// Space
          const SizedBox(
            height: AppDimensions.paddingOrMargin16,
          ),

          /// Description
          AppTextWidget(
            AppStrings.description.tr(),
            fontWeight: FontWeight.bold,
            fontSize: AppDimensions.fontSize10,
          ),

          /// Space
          const SizedBox(
            height: AppDimensions.paddingOrMargin8,
          ),

          /// Description text field
          AppTextFieldWidget(
            textController: descriptionController,
            backgroundColor: AppColors.onPrimary,
            verticalPadding: AppDimensions.paddingOrMargin14,
            horizontalPadding: AppDimensions.paddingOrMargin16,
            textColor: AppColors.gray03,
            hintText: AppStrings.taskDescription.tr(),
            textInputAction: TextInputAction.done,
            maxLines: AppConstants.maxLines,
            fontSize: AppDimensions.fontSize10,
            keyboardType: TextInputType.multiline,
          ),
        ],
      ),
    );
  }
}
