import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/app/core/themes/app_colors.dart';
import 'package:to_do/app/core/translations/app_strings.dart';
import 'package:to_do/app/core/values/constant/app_assets.dart';
import 'package:to_do/app/core/values/constant/app_constants.dart';
import 'package:to_do/app/core/values/constant/app_dimensions.dart';
import 'package:to_do/app/features/tasks/domain/entities/single_tasks_data.dart';
import 'package:to_do/app/features/tasks/presentation/blocs/tasks_bloc.dart';
import 'package:to_do/app/features/tasks/presentation/list_task/views/widgets/item_popup_menu_widget.dart';
import 'package:to_do/app/global_widgets/app_icon_widget.dart';
import 'package:to_do/app/global_widgets/app_text_widget.dart';

class TaskItemWidget extends StatefulWidget {
  final SingleTaskData task;

  const TaskItemWidget({super.key, required this.task});

  @override
  State<TaskItemWidget> createState() => _TaskItemWidgetState();
}

class _TaskItemWidgetState extends State<TaskItemWidget> {
  late bool _completed;

  @override
  void initState() {
    _completed = widget.task.completed;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteBlue.withOpacity(.9),
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      margin: const EdgeInsets.only(
        bottom: AppDimensions.paddingOrMargin8,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Check Box
                Checkbox(
                  value: _completed,
                  activeColor: AppColors.primary,
                  onChanged: (value) {
                    BlocProvider.of<TasksBloc>(context).add(
                      UpdateTaskEvent(
                        completed: !_completed,
                        todoId: widget.task.id,
                      ),
                    );
                    setState(() {
                      _completed = !_completed;
                    });
                  },
                ),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Description
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: AppDimensions.paddingOrMargin4,
                              ),
                              child: AppTextWidget(
                                widget.task.todo,
                                fontSize: AppDimensions.fontSize07,
                              ),
                            ),
                          ),

                          /// Popup
                          PopupMenuButton<int>(
                            color: AppColors.white01,
                            elevation: AppDimensions.elevation01,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: const AppIconWidget(
                              iconPath: AppAssets.verticalMenu,
                              color: AppColors.black00,
                            ),
                            onSelected: (value) {
                              if (value == AppConstants.index01) {
                                BlocProvider.of<TasksBloc>(context).add(
                                  DeleteTaskEvent(todoId: widget.task.id),
                                );
                              }
                            },
                            itemBuilder: (BuildContext context) {
                              return const [
                                /*       PopupMenuItem<int>(
                                  value: AppConstants.index00,
                                  child: ItemPopupMenuWidget(
                                    iconItem: AppAssets.edit,
                                    titleItem: AppStrings.editTask,
                                  ),
                                ),*/
                                PopupMenuItem<int>(
                                  value: AppConstants.index01,
                                  child: ItemPopupMenuWidget(
                                    iconItem: AppAssets.delete,
                                    titleItem: AppStrings.deleteTask,
                                    iconColor: AppColors.red01,
                                    titleColor: AppColors.red01,
                                  ),
                                ),
                              ];
                            },
                          ),
                        ],
                      ),

                      /// Space
                      const SizedBox(
                        height: 8,
                      ),

                      /// Date
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(.1),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: const Row(
                          children: [
                            ///Icon
                            AppIconWidget(
                              iconPath: AppAssets.calenderTask,
                              color: AppColors.black01,
                              size: 16,
                            ),

                            /// Space
                            SizedBox(
                              width: 8,
                            ),

                            /// Date From and two
                            Expanded(
                              child: AppTextWidget(
                                '22 Aug, 2024 - 23 Aug, 2024',
                                fontSize: AppDimensions.fontSize07,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
