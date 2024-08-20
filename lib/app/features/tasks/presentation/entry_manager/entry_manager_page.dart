import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:to_do/app/core/themes/app_colors.dart';
import 'package:to_do/app/core/translations/app_strings.dart';
import 'package:to_do/app/core/values/constant/app_dimensions.dart';
import 'package:to_do/app/core/values/constant/app_settings.dart';
import 'package:to_do/app/features/tasks/presentation/entry_manager/views/entry_manager_calender_view.dart';
import 'package:to_do/app/features/tasks/presentation/entry_manager/views/entry_manager_field_view.dart';
import 'package:to_do/app/global_widgets/app_button_widget.dart';
import 'package:to_do/app/global_widgets/app_text_widget.dart';

class EntryManagerPage extends StatelessWidget {
  const EntryManagerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: AppSettings.heroFloatingButton,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: AppColors.white01,

          /// App Bar
          appBar: AppBar(
            backgroundColor: AppColors.white01,
            title: AppTextWidget(
              AppStrings.createTask.tr(),
              fontSize: AppDimensions.fontSize12,
            ),
          ),

          /// body
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.paddingOrMargin16,
            ),
            child: ListView(
              children: [
                /// Calender
                const EntryManagerCalenderView(),

                /// TextFiled title and description
                const EntryManagerFieldView(),

                /// Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Cancel
                    AppButtonWidget(
                      width: AppDimensions.width180,
                      text: AppStrings.cancel.tr(),
                      fontSize: AppDimensions.fontSize10,
                      onPressed: () {},
                      color: AppColors.primary,
                      padding: const EdgeInsetsDirectional.symmetric(
                        horizontal: AppDimensions.paddingOrMargin16,
                      ),
                      isBordered: true,
                    ),

                    /// Save
                    AppButtonWidget(
                      width: AppDimensions.width180,
                      text: AppStrings.save.tr(),
                      fontSize: AppDimensions.fontSize10,
                      onPressed: () {},
                      color: AppColors.primary,
                      padding: const EdgeInsetsDirectional.symmetric(
                        horizontal: AppDimensions.paddingOrMargin16,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
