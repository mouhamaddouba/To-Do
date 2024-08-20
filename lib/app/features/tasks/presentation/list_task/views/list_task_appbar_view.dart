import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:to_do/app/core/themes/app_colors.dart';
import 'package:to_do/app/core/translations/app_strings.dart';
import 'package:to_do/app/core/values/constant/app_assets.dart';
import 'package:to_do/app/core/values/constant/app_constants.dart';
import 'package:to_do/app/core/values/constant/app_dimensions.dart';
import 'package:to_do/app/core/values/constant/app_settings.dart';
import 'package:to_do/app/features/tasks/presentation/list_task/views/widgets/item_popup_menu_widget.dart';
import 'package:to_do/app/global_widgets/app_icon_widget.dart';
import 'package:to_do/app/global_widgets/app_text_widget.dart';

class ListTaskAppbarView extends StatelessWidget
    implements PreferredSizeWidget {
  const ListTaskAppbarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white01,
      automaticallyImplyLeading: false,
      elevation: AppDimensions.zero,

      /// Title
      title: AppTextWidget(
        '${AppStrings.hello.tr()}  ${AppSettings.user.username}',
        fontSize: AppDimensions.fontSize10,
        fontWeight: FontWeight.w500,
      ),

      /// MenuButton
      actions: [
        PopupMenuButton<int>(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppDimensions.paddingOrMargin10,
            ),
          ),
          elevation: AppDimensions.elevation01,
          itemBuilder: (BuildContext context) {
            return const [
              // Sort by date
              PopupMenuItem<int>(
                value: AppConstants.index00,
                child: ItemPopupMenuWidget(
                  iconItem: AppAssets.calenderTask,
                  titleItem: AppStrings.calenderTask,
                ),
              ),

              // Completed task
              PopupMenuItem<int>(
                value: AppConstants.index01,
                child: ItemPopupMenuWidget(
                  iconItem: AppAssets.completeTask,
                  titleItem: AppStrings.completeTask,
                ),
              ),

              // Pending tasks
              PopupMenuItem<int>(
                value: AppConstants.index02,
                child: ItemPopupMenuWidget(
                  iconItem: AppAssets.pendingTask,
                  titleItem: AppStrings.pendingTask,
                ),
              ),
            ];
          },

          /// Icon Filter
          child: const Padding(
            padding: EdgeInsets.only(
              right: AppDimensions.paddingOrMargin16,
            ),
            child: AppIconWidget(
              iconPath: AppAssets.filter,
              color: AppColors.black01,
            ),
          ),
          onSelected: (value) {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
