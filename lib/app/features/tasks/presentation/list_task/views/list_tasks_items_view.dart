import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:to_do/app/core/themes/app_colors.dart';
import 'package:to_do/app/core/translations/app_strings.dart';
import 'package:to_do/app/core/values/constant/app_constants.dart';
import 'package:to_do/app/core/values/constant/app_dimensions.dart';
import 'package:to_do/app/features/tasks/presentation/list_task/views/widgets/task_item_widget.dart';
import 'package:to_do/app/global_widgets/app_icon_widget.dart';
import 'package:to_do/app/global_widgets/app_text_field_widget.dart';

class ListTasksItemsView extends StatelessWidget {
  const ListTasksItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Column(
      children: [
        /// Text Field Search
        AppTextFieldWidget(
          textController: searchController,
          backgroundColor: Theme.of(context).brightness == Brightness.light
              ? AppColors.onPrimary
              : AppColors.darkOnPrimary,
          verticalPadding: AppDimensions.paddingOrMargin14,
          textColor: Theme.of(context).brightness == Brightness.light
              ? AppColors.black01
              : AppColors.whiteBlue,
          hintText: AppStrings.password.tr(),
          textInputAction: TextInputAction.done,
          horizontalPadding: AppDimensions.paddingOrMargin16,
          maxLines: AppConstants.maxLines,
          fontSize: AppDimensions.fontSize10,
          prefixIcon: AppIconWidget(
            color: Theme.of(context).brightness == Brightness.light
                ? AppColors.gray03
                : AppColors.darkPrimary,
            iconData: Icons.search,
          ),
        ),

        /// Space
        const SizedBox(
          height: AppDimensions.paddingOrMargin24,
        ),

        /// List task
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return const TaskItemWidget();
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: AppDimensions.paddingOrMargin8,
              );
            },
          ),
        )
      ],
    );
  }
}
