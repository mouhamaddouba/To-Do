import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:to_do/app/core/themes/app_colors.dart';
import 'package:to_do/app/core/translations/app_strings.dart';
import 'package:to_do/app/core/values/constant/app_dimensions.dart';
import 'package:to_do/app/global_widgets/app_text_widget.dart';

class EntryManagerCalenderView extends StatefulWidget {
  const EntryManagerCalenderView({super.key});

  @override
  State<EntryManagerCalenderView> createState() =>
      _EntryManagerCalenderViewState();
}

class _EntryManagerCalenderViewState extends State<EntryManagerCalenderView> {
  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;
  DateTime? rangeStart;
  DateTime? rangeEnd;

  @override
  void initState() {
    selectedDay = focusedDay;
    super.initState();
  }

  _onRangeSelected(DateTime? start, DateTime? end, DateTime focusDay) {
    setState(() {
      selectedDay = null;
      focusedDay = focusDay;
      rangeStart = start;
      rangeEnd = end;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Calender
        TableCalendar(
          calendarFormat: calendarFormat,
          startingDayOfWeek: StartingDayOfWeek.monday,
          availableCalendarFormats: const {
            CalendarFormat.month: 'Month',
            CalendarFormat.week: 'Week',
          },
          rangeSelectionMode: RangeSelectionMode.toggledOn,
          focusedDay: focusedDay,
          firstDay: DateTime.utc(2024, 1, 1),
          lastDay: DateTime.utc(2030, 1, 1),
          onPageChanged: (focusDay) {
            focusedDay = focusDay;
          },
          selectedDayPredicate: (day) => isSameDay(selectedDay, day),
          rangeStartDay: rangeStart,
          rangeEndDay: rangeEnd,
          onFormatChanged: (format) {
            if (calendarFormat != format) {
              setState(() {
                calendarFormat = format;
              });
            }
          },
          onRangeSelected: _onRangeSelected,
        ),

        /// Space
        const SizedBox(
          height: AppDimensions.paddingOrMargin10,
        ),

        /// Container time selected
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: AppDimensions.paddingOrMargin16,
            horizontal: AppDimensions.paddingOrMargin16,
          ),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(.1),
            borderRadius: const BorderRadius.all(
              Radius.circular(
                AppDimensions.radius05,
              ),
            ),
          ),
          child: AppTextWidget(
            rangeStart != null && rangeEnd != null
                ? AppStrings.taskStart.tr()
                : AppStrings.selectDate.tr(),
            textColor: AppColors.primary,
            fontWeight: FontWeight.w400,
            fontSize: AppDimensions.fontSize08,
          ),
        ),
      ],
    );
  }
}
