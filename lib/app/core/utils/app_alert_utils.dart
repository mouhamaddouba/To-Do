// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:to_do/app/core/translations/app_strings.dart';
// import 'package:to_do/app/core/values/constant/app_constants.dart';
// import 'package:to_do/app/core/values/enums/dialog_type_enum.dart';
// import 'package:to_do/app/global_widgets/app_button_widget.dart';
//
// abstract class AppAlertUtils {
//   static void showDialog({
//     String title = AppStrings.alert,
//     String message = AppConstants.emptyText,
//     Widget? icon,
//     DialogTypeEnum dialogTypeEnum = DialogTypeEnum.primary,
//     String? textConfirm = AppStrings.ok,
//     String? textCancel = AppStrings.cancel,
//     Widget? content,
//     double? height,
//     bool barrierDismissible = true,
//     TextAlign? textAlign,
//     List<AppButtonWidget> actionButtons = const [],
//     Function()? onConfirm,
//     Function()? onCancel,
//     Function(dynamic)? onAfter,
//   }) {
//     Get.dialog(
//       AppDefaultDialogWidget(
//         textConfirm: textConfirm,
//         title: title.tr(),
//         message: message,
//         height: height,
//         textAlign: textAlign,
//         icon: icon,
//         dialogTypeEnum: dialogTypeEnum,
//         content: content,
//         actionButtons: actionButtons,
//         onConfirm: onConfirm,
//         onCancel: onCancel,
//       ),
//       barrierDismissible: true,
//     ).then((value) {
//       if (onAfter != null) {
//         onAfter(value);
//       }
//     });
//   }
// }
