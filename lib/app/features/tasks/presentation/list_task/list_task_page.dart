import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/app/core/themes/app_colors.dart';
import 'package:to_do/app/core/translations/app_strings.dart';
import 'package:to_do/app/core/values/constant/app_dimensions.dart';
import 'package:to_do/app/features/tasks/presentation/blocs/tasks_bloc.dart';
import 'package:to_do/app/features/tasks/presentation/list_task/views/list_task_appbar_view.dart';
import 'package:to_do/app/features/tasks/presentation/list_task/views/list_task_float_button_view.dart';
import 'package:to_do/app/features/tasks/presentation/list_task/views/list_tasks_items_view.dart';
import 'package:to_do/app/global_widgets/app_loading_widget.dart';
import 'package:to_do/app/global_widgets/app_no_data_found_widget.dart';

class ListTaskPage extends StatefulWidget {
  const ListTaskPage({
    super.key,
  });

  @override
  State<ListTaskPage> createState() => _ListTaskPageState();
}

class _ListTaskPageState extends State<ListTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        /// AppBar
        backgroundColor: AppColors.white01,
        appBar: const ListTaskAppbarView(),

        /// Body
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: const EdgeInsets.all(
              AppDimensions.paddingOrMargin16,
            ),
            child: BlocConsumer<TasksBloc, TasksState>(
              /// For error in fetch data
              listener: (context, state) {
                if (state is TasksLoadError) {}
              },
              builder: (context, state) {
                if (state is TasksLoading) {
                  /// For loading data
                  return const Center(
                    child: AppLoadingWidget(),
                  );
                }

                /// for no data found
                if (state is TasksLoaded) {
                  if (state.tasks.todos.isEmpty) {
                    return Center(
                      child: AppNoDataFoundWidget(
                        title: AppStrings.noTaskYet.tr(),
                      ),
                    );
                  } else {
                    /// fetch data success
                    return ListTasksItemsView(
                      tasksList: state.tasks.todos,
                    );
                  }
                }
                return Center(
                  child: AppNoDataFoundWidget(
                    title: AppStrings.noTaskYet.tr(),
                  ),
                );
              },
            ),
          ),
        ),

        /// Floating Button
        floatingActionButton: const ListTaskFloatButtonView(),
      );
    });
  }
}
