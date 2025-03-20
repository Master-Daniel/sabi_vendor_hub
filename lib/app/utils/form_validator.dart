import 'package:get/get.dart';

class FormValidator {
  static String? isValidEmail(String? email) {
    final RegExp emailRegExp =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (!emailRegExp.hasMatch(email!)) {
      return 'invalid_email'.tr;
    }
    return null;
  }

  static String? isValidName(String? name) {
    if (name == null || name.isEmpty) {
      return 'name_required'.tr;
    }

    // Regular expression to ensure the name contains only letters and has no spaces or numbers
    final nameRegExp = RegExp(r'^[a-zA-Z]{3,}$');
    if (!nameRegExp.hasMatch(name)) {
      return 'invalid_name'.tr;
    }

    if (name.length > 50) {
      // Adjust maximum length as necessary
      return 'name_too_long'.tr;
    }

    return null;
  }

  static String? isValidPrice(String? price) {
    if (price == null || price.isEmpty) {
      return null;
    }

    if (double.tryParse(price) == null) {
      return 'invalid_price'.tr;
    }

    if (double.parse(price) < 1) {
      return 'min_price'.tr;
    }

    return null;
  }

  static String? isValidBudget(String? budget) {
    if (budget == null || budget.isEmpty) {
      return null;
    }

    if (double.tryParse(budget) == null) {
      return 'invalid_budget'.tr;
    }

    if (double.parse(budget) < 1) {
      return 'min_budget'.tr;
    }

    return null;
  }

  static String? isItemName(String? name) {
    if (name == null || name.isEmpty) {
      return 'item_name_required'.tr;
    }

    if (name.length < 3) {
      return 'item_name_too_short'.tr;
    }

    if (name.length > 100) {
      return 'item_name_too_long'.tr;
    }

    return null;
  }

  static String? isValidRequest(String? name) {
    if (name == null || name.isEmpty) {
      return 'request_required'.tr;
    }

    if (name.length < 3) {
      return 'request_too_short'.tr;
    }

    if (name.length > 200) {
      return 'request_too_long'.tr;
    }

    return null;
  }

  static String? isValidFullName(String? fullName) {
    if (fullName == null || fullName.isEmpty) {
      return 'full_name_required'.tr;
    }

    final fullNameRegExp = RegExp(r'^[a-zA-Z ]{3,}(?: [a-zA-Z ]{3,}){1,}$');
    if (!fullNameRegExp.hasMatch(fullName)) {
      return 'invalid_full_name'.tr;
    }

    if (fullName.length > 85) {
      return 'full_name_too_long'.tr;
    }

    return null;
  }

  static String? isValidOTP(
    String? data,
  ) {
    if (data == null || data.isEmpty) {
      return 'otp_required'.tr;
    }
    if (data.length > 6) {
      return 'otp_too_long'.tr;
    }
    if (data.length < 6) {
      return 'otp_too_short'.tr;
    }
    return null;
  }

  static String? isValidPassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'password_required'.tr;
    }

    // Check for at least 8 characters
    if (password.length < 6) {
      return 'password_too_short'.tr;
    }
    return null;
  }

  static String? isValidPhoneNumber(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return 'phone_required'.tr;
    }

    String cleanedNumber = phoneNumber.replaceAll(RegExp(r'\s+'), '');

    if (cleanedNumber.length > 15) {
      return 'phone_too_long'.tr;
    }
    if (cleanedNumber.length < 10) {
      return 'phone_too_short'.tr;
    }
    if (!RegExp(r'^\+?\d+$').hasMatch(cleanedNumber)) {
      return 'invalid_phone'.tr;
    }

    return null;
  }

  static String? isValidInstagramHandle(String? handle) {
    if (handle == null || handle.isEmpty) {
      return 'instagram_required'.tr;
    }

    handle = handle.startsWith('@') ? handle.substring(1) : handle;

    if (handle.length > 30) {
      return 'instagram_too_long'.tr;
    }
    if (!RegExp(r'^[a-zA-Z0-9._]+$').hasMatch(handle)) {
      return 'invalid_instagram'.tr;
    }
    if (handle.startsWith('.') ||
        handle.startsWith('_') ||
        handle.endsWith('.') ||
        handle.endsWith('_')) {
      return 'invalid_instagram_ends'.tr;
    }
    if (handle.contains('..') || handle.contains('__')) {
      return 'invalid_instagram_consecutive'.tr;
    }

    return null;
  }

  static String? isValidJobTitle(String? jobTitle) {
    if (jobTitle == null || jobTitle.isEmpty) {
      return 'job_title_required'.tr;
    }

    if (jobTitle.length < 5) {
      return 'job_title_too_short'.tr;
    }

    if (jobTitle.length > 50) {
      return 'job_title_too_long'.tr;
    }

    return null;
  }

  static String? isValidJobDescription(String? jobDescription) {
    if (jobDescription == null || jobDescription.isEmpty) {
      return null;
    }
    if (jobDescription.length < 10 && jobDescription.isNotEmpty) {
      return 'job_description_too_short'.tr;
    }

    if (jobDescription.length > 500) {
      return 'job_description_too_long'.tr;
    }

    return null;
  }

  static String? isValidReport(String? report) {
    if (report == null || report.isEmpty) {
      return 'report_required'.tr;
    }

    if (report.length > 500) {
      return 'report_too_long'.tr;
    }

    return null;
  }

  static String? isValidJobLocation(String? jobLocation) {
    if (jobLocation == null) {
      return 'job_location_required'.tr;
    }

    return null;
  }


static String? isValidItemLocation(String? location, String latitude, String longitude) {
  if (location == null || location.isEmpty) {
    return 'location_required'.tr;
  }


  if (latitude.isEmpty || longitude.isEmpty) {
    return 'invalid_location'.tr; 
  }

  return null; 
}

  static isValidMaxApplicants(String? s) {
    if (s == null || s.isEmpty) {
      return 'max_applicants_required'.tr;
    }
    if (int.tryParse(s) == null) {
      return 'invalid_max_applicants'.tr;
    }
    if (int.parse(s) < 1) {
      return 'min_max_applicants'.tr;
    }
    return null;
  }

  static String? isValidDeleteAccount (String? s) {
    if(s != "DELETE ACCOUNT") {
      return 'delete_account_confirm_label'.tr;
    }
    return null;
  }
}
