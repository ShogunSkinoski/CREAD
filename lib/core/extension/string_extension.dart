import 'package:cread/core/constants/app/app_constants.dart';
import 'package:easy_localization/easy_localization.dart';

extension StringLocalization on String {
  String get locale => this.tr();
}

extension StringExtension on String {
  bool isValidEmail() {
    final RegExp regex = RegExp(AppConstants.EMAIL_REGEX);
    return regex.hasMatch(this);
  }
}
