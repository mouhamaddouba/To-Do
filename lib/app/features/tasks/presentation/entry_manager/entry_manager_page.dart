import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/app/core/themes/app_colors.dart';
import 'package:to_do/app/core/translations/app_strings.dart';
import 'package:to_do/app/core/values/constant/app_dimensions.dart';
import 'package:to_do/app/core/values/constant/app_settings.dart';
import 'package:to_do/app/features/tasks/presentation/blocs/tasks_bloc.dart';
import 'package:to_do/app/features/tasks/presentation/entry_manager/views/entry_manager_calender_view.dart';
import 'package:to_do/app/features/tasks/presentation/entry_manager/views/entry_manager_field_view.dart';
import 'package:to_do/app/global_widgets/app_button_widget.dart';
import 'package:to_do/app/global_widgets/app_text_widget.dart';

class EntryManagerPage extends StatefulWidget {
  const EntryManagerPage({super.key});

  @override
  State<EntryManagerPage> createState() => _EntryManagerPageState();
}

class _EntryManagerPageState extends State<EntryManagerPage> {
  TextEditingController descriptionController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
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
            body: Form(
              key: loginFormKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingOrMargin16,
                ),
                child: ListView(
                  children: [
                    /// Calender
                    const EntryManagerCalenderView(),

                    /// TextFiled title and description
                    EntryManagerFieldView(controller: descriptionController),

                    /// Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// Cancel
                        AppButtonWidget(
                          width: AppDimensions.width180,
                          text: AppStrings.cancel.tr(),
                          fontSize: AppDimensions.fontSize10,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          color: AppColors.primary,
                          padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: AppDimensions.paddingOrMargin16,
                          ),
                          isBordered: true,
                        ),

                        /// Save
                        BlocConsumer<TasksBloc, TasksState>(
                          listener: (BuildContext context, TasksState state) {
                            if (state is TasksLoaded) {
                              Navigator.of(context).pop();
                            }
                            if (state is TasksLoadError) {
                              Navigator.of(context).pop();
                            }
                          },
                          builder: (context, state) {
                            if (state is TasksLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return AppButtonWidget(
                              width: AppDimensions.width180,
                              text: AppStrings.save.tr(),
                              fontSize: AppDimensions.fontSize10,
                              onPressed: () {
                                if (loginFormKey.currentState!.validate()) {
                                  BlocProvider.of<TasksBloc>(context).add(
                                    AddNewTaskEvent(
                                        todo: descriptionController.text,
                                        completed: false,
                                        userId: AppSettings.user.id),
                                  );
                                }
                              },
                              color: AppColors.primary,
                              padding: const EdgeInsetsDirectional.symmetric(
                                horizontal: AppDimensions.paddingOrMargin16,
                              ),
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
