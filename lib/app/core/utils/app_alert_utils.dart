import 'package:flutter/material.dart';
import 'package:to_do/app/core/translations/app_strings.dart';
import 'package:to_do/app/core/values/enums/dialog_type_enum.dart';
import 'package:to_do/app/global_widgets/app_animation_dialog_widget.dart';
import 'package:to_do/app/global_widgets/app_button_widget.dart';

abstract class AppAlertUtils {
  static Future<dynamic> showDialog({
    String? title = AppStrings.alert,
    String message = '',
    Widget? icon,
    DialogTypeEnum dialogTypeEnum = DialogTypeEnum.primary,
    String? textConfirm,
    String? textCancel,
    Widget? content,
    bool barrierDismissible = true,
    List<AppButtonWidget> actionButtons = const [],
    Function()? onConfirm,
    Function()? onCancel,
    Function(dynamic)? onAfter,
    required BuildContext context,
    Widget? bodyContent,
    bool isNewBody = false,
  }) {
    return showGeneralDialog(
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return AppAnimationDialogWidget(
          title: title,
          message: message,
          icon: icon,
          dialogTypeEnum: dialogTypeEnum,
          content: content,
          textConfirm: textConfirm,
          textCancel: textCancel,
          actionButtons: actionButtons,
          onConfirm: onConfirm ??
              () {
                Navigator.of(context).pop();
              },
          onCancel: onCancel,
          bodyContent: bodyContent,
          isNewBody: isNewBody,
        );
      },
      transitionBuilder: (context, animation1, animation2, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, -1),
            end: const Offset(0, 0),
          ).animate(animation1),
          child: child,
        );
      },
    );
  }
}
