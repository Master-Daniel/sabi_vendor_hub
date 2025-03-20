import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:sabi_vendor_hub_mobile/app/utils/app_logger.dart';

class GoogleAnalyticsService {
  static final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  // Auth Events
  static Future<void> logSignInWithGoogle() async {
    await _logEvent(
      name: 'auth_sign_in_google',
      category: 'auth',
    );
  }

  static Future<void> logSignInWithEmail() async {
    await _logEvent(
      name: 'auth_sign_in_email',
      category: 'auth',
    );
  }

  static Future<void> logContinueWithoutLogin() async {
    await _logEvent(
      name: 'auth_continue_without_login',
      category: 'auth',
    );
  }

  // Item Interaction Events
  static Future<void> logItemClick({required String itemId}) async {
    await _logEvent(
      name: 'item_click',
      category: 'item_interaction',
      parameters: {'item_id': itemId},
    );
  }

  static Future<void> logItemShare({required String itemId}) async {
    await _logEvent(
      name: 'item_share',
      category: 'item_interaction',
      parameters: {'item_id': itemId},
    );
  }

  static Future<void> logItemSave({required String itemId}) async {
    await _logEvent(
      name: 'item_save',
      category: 'item_interaction',
      parameters: {'item_id': itemId},
    );
  }

// todo
  static Future<void> logItemClickSimilar({required String itemId}) async {
    await _logEvent(
      name: 'item_click_similar',
      category: 'item_interaction',
      parameters: {'item_id': itemId},
    );
  }

  static Future<void> logItemImageClick({required String itemId}) async {
    await _logEvent(
      name: 'item_image_click',
      category: 'item_interaction',
      parameters: {'item_id': itemId},
    );
  }

  static Future<void> logItemReport(
      {required String itemId, String? reason}) async {
    await _logEvent(
      name: 'item_report',
      category: 'item_interaction',
      parameters: {
        'item_id': itemId,
        if (reason != null) 'reason': reason,
      },
    );
  }

  // Shop Interaction Events
  static Future<void> logShopView({required String shopId}) async {
    await _logEvent(
      name: 'shop_view',
      category: 'shop_interaction',
      parameters: {'shop_id': shopId},
    );
  }

  // Explore Events
  static Future<void> logExploreClick() async {
    await _logEvent(
      name: 'explore_click',
      category: 'explore',
    );
  }

  static Future<void> logExploreMapInteract({
    required double latitude,
    required double longitude,
    required double zoomLevel,
  }) async {
    await _logEvent(
      name: 'explore_map_interact',
      category: 'explore',
      parameters: {
        'latitude': latitude,
        'longitude': longitude,
        'zoom_level': zoomLevel,
      },
    );
  }

  // Search Events
  static Future<void> logSearchClick() async {
    await _logEvent(
      name: 'search_click',
      category: 'search',
    );
  }

  static Future<void> logSearchTerm({required String searchTerm}) async {
    await _logEvent(
      name: 'search_term_entered',
      category: 'search',
      parameters: {'search_term': searchTerm},
    );
  }

  // Category Events
  static Future<void> logCategoryClick({required String categoryId}) async {
    await _logEvent(
      name: 'category_click',
      category: 'category_interaction',
      parameters: {'category_id': categoryId},
    );
  }

  static Future<void> logCategorySelect({
    required String categoryId,
    required String categoryName,
  }) async {
    await _logEvent(
      name: 'category_select',
      category: 'category_interaction',
      parameters: {
        'category_id': categoryId,
        'category_name': categoryName,
      },
    );
  }

  // Profile Events
  static Future<void> logProfileClick({required String userId}) async {
    await _logEvent(
      name: 'profile_click',
      category: 'profile',
      parameters: {'user_id': userId},
    );
  }

  static Future<void> logProfileEdit() async {
    await _logEvent(
      name: 'profile_edit_click',
      category: 'profile',
    );
  }

  // Profile Edit Events
  static Future<void> logProfilePictureChange() async {
    await _logEvent(
      name: 'profile_picture_change',
      category: 'profile_edit',
    );
  }

  static Future<void> logDefaultCurrencyChange(
      {required String currency}) async {
    await _logEvent(
      name: 'default_currency_change',
      category: 'profile_edit',
      parameters: {'currency': currency},
    );
  }

  static Future<void> logProfileNameChange() async {
    await _logEvent(
      name: 'profile_name_change',
      category: 'profile_edit',
    );
  }

  static Future<void> logUsernameChange() async {
    await _logEvent(
      name: 'username_change',
      category: 'profile_edit',
    );
  }

  // Contact Management Events
  static Future<void> logContactOptionAdd({required String optionType}) async {
    await _logEvent(
      name: 'contact_option_add',
      category: 'contact_management',
      parameters: {'option_type': optionType},
    );
  }

  static Future<void> logContactOptionDelete(
      {required String optionType}) async {
    await _logEvent(
      name: 'contact_option_delete',
      category: 'contact_management',
      parameters: {'option_type': optionType},
    );
  }

  static Future<void> logContactOptionActivate(
      {required String optionType}) async {
    await _logEvent(
      name: 'contact_option_activate',
      category: 'contact_management',
      parameters: {'option_type': optionType},
    );
  }

  static Future<void> logContactOptionDeactivate(
      {required String optionType}) async {
    await _logEvent(
      name: 'contact_option_deactivate',
      category: 'contact_management',
      parameters: {'option_type': optionType},
    );
  }

  static Future<void> logContactOptionEdit({required String optionType}) async {
    await _logEvent(
      name: 'contact_option_edit',
      category: 'contact_management',
      parameters: {'option_type': optionType},
    );
  }

  //ANCHOR - Failure Events

  // Auth Events
  static Future<void> logSignInWithGoogleFail({String? error}) async {
    await _logEvent(
      name: 'auth_sign_in_google_fail',
      category: 'auth_fail',
      parameters: {'error': error},
    );
  }

  static Future<void> logSignInWithEmailFail({String? error}) async {
    await _logEvent(
      name: 'auth_sign_in_email_fail',
      category: 'auth_fail',
      parameters: {'error': error},
    );
  }

  // Item Interaction Failure Events
  static Future<void> logItemShareFail({
    required String itemId,
    String? error,
  }) async {
    await _logEvent(
      name: 'item_share_fail',
      category: 'item_interaction_fail',
      parameters: {
        'item_id': itemId,
        if (error != null) 'error': error,
      },
    );
  }

  static Future<void> logItemSaveFail({
    required String itemId,
    String? error,
  }) async {
    await _logEvent(
      name: 'item_save_fail',
      category: 'item_interaction_fail',
      parameters: {
        'item_id': itemId,
        if (error != null) 'error': error,
      },
    );
  }

  static Future<void> logItemReportFail({
    required String itemId,
    String? reason,
    String? error,
  }) async {
    await _logEvent(
      name: 'item_report_fail',
      category: 'item_interaction_fail',
      parameters: {
        'item_id': itemId,
        if (reason != null) 'reason': reason,
        if (error != null) 'error': error,
      },
    );
  }

  // Profile Edit Failure Events
  static Future<void> logProfilePictureChangeFail({String? error}) async {
    await _logEvent(
      name: 'profile_picture_change_fail',
      category: 'profile_edit_fail',
      parameters: {
        if (error != null) 'error': error,
      },
    );
  }

  static Future<void> logDefaultCurrencyChangeFail({
    required String currency,
    String? error,
  }) async {
    await _logEvent(
      name: 'default_currency_change_fail',
      category: 'profile_edit_fail',
      parameters: {
        'currency': currency,
        if (error != null) 'error': error,
      },
    );
  }

  static Future<void> logProfileNameChangeFail({String? error}) async {
    await _logEvent(
      name: 'profile_name_change_fail',
      category: 'profile_edit_fail',
      parameters: {
        if (error != null) 'error': error,
      },
    );
  }

  static Future<void> logUsernameChangeFail({String? error}) async {
    await _logEvent(
      name: 'username_change_fail',
      category: 'profile_edit_fail',
      parameters: {
        if (error != null) 'error': error,
      },
    );
  }

  // Contact Management Failure Events
  static Future<void> logContactOptionAddFail({
    required String optionType,
    String? error,
  }) async {
    await _logEvent(
      name: 'contact_option_add_fail',
      category: 'contact_management_fail',
      parameters: {
        'option_type': optionType,
        if (error != null) 'error': error,
      },
    );
  }

  static Future<void> logContactOptionDeleteFail({
    required String optionType,
    String? error,
  }) async {
    await _logEvent(
      name: 'contact_option_delete_fail',
      category: 'contact_management_fail',
      parameters: {
        'option_type': optionType,
        if (error != null) 'error': error,
      },
    );
  }

  static Future<void> logContactOptionActivateFail({
    required String optionType,
    String? error,
  }) async {
    await _logEvent(
      name: 'contact_option_activate_fail',
      category: 'contact_management_fail',
      parameters: {
        'option_type': optionType,
        if (error != null) 'error': error,
      },
    );
  }

  static Future<void> logContactOptionDeactivateFail({
    required String optionType,
    String? error,
  }) async {
    await _logEvent(
      name: 'contact_option_deactivate_fail',
      category: 'contact_management_fail',
      parameters: {
        'option_type': optionType,
        if (error != null) 'error': error,
      },
    );
  }

  static Future<void> logContactOptionEditFail({
    required String optionType,
    String? error,
  }) async {
    await _logEvent(
      name: 'contact_option_edit_fail',
      category: 'contact_management_fail',
      parameters: {
        'option_type': optionType,
        if (error != null) 'error': error,
      },
    );
  }

  //
  // Private helper method to log events
  static Future<void> _logEvent({
    required String name,
    required String category,
    Map<String, dynamic>? parameters,
  }) async {
    if (kDebugMode) {
      appLog('Event: $name, Category: $category, Parameters: $parameters');
      return;
    }
    try {
      final Map<String, dynamic> eventParameters = {
        'category': category,
        ...?parameters,
      };

      await _analytics.logEvent(
        name: name,
        parameters: eventParameters.cast<String, Object>(),
      );
    } catch (e) {
      appLog('Error logging event: $e');
    }
  }
}
