abstract class AppAssets {
  static const String _assets = 'assets';

  ///region Subfolder assets

  static const String _icons = '$_assets/icons';
  static const String _images = '$_assets/images';
  static const String _svgs = '$_assets/svgs';

  /// region icons
  static const String filter = '$_icons/filter.svg';
  static const String calenderTask = '$_icons/calender.svg';
  static const String completeTask = '$_icons/task_checked.svg';
  static const String pendingTask = '$_icons/task.svg';
  static const String edit = '$_icons/edit.svg';
  static const String delete = '$_icons/delete.svg';

  ///region Image
  static const String emptyImage = '$_images/emptyImage';
  static const String logo = '$_images/app_logo.png';

  ///region Svgs
  static const String logInToDo = '$_svgs/login_to_do.svg';
}
