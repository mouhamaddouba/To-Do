import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/app/core/translations/app_strings.dart';
import 'package:to_do/app/core/values/constant/app_dimensions.dart';
import 'package:to_do/app/features/tasks/presentation/blocs/tasks_bloc.dart';
import 'package:to_do/app/features/tasks/presentation/list_task/views/list_task_appbar_view.dart';
import 'package:to_do/app/features/tasks/presentation/list_task/views/list_task_float_button_view.dart';
import 'package:to_do/app/features/tasks/presentation/list_task/views/list_tasks_items_view.dart';
import 'package:to_do/app/global_widgets/app_loading_widget.dart';
import 'package:to_do/app/global_widgets/app_no_data_found_widget.dart';

class ListTaskPage extends StatelessWidget {
  const ListTaskPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc()..add(FetchTaskEvent()),
      child: Builder(builder: (context) {
        return Scaffold(
          /// AppBar
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
                          title: AppStrings.alertSuccess.tr(),
                        ),
                      );
                    } else {
                      /// fetch data success
                      return const ListTasksItemsView();
                    }
                  }
                  return Center(
                    child: AppNoDataFoundWidget(
                      title: AppStrings.alertSuccess.tr(),
                    ),
                  );
                },
              ),
            ),
          ),

          /// Floating Button
          floatingActionButton: const ListTaskFloatButtonView(),
        );
      }),
    );
  }
}
