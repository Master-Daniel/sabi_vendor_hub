import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NotificationService {
  static RxList<AppNotification> notifications = <AppNotification>[].obs;
  static RxInt unreadCount = 0.obs;

  static void init() {
    final box = GetStorage();
    final storedNotifications = box.read("notifications");
    if (storedNotifications != null) {
      notifications.addAll(
        List<AppNotification>.from(
          storedNotifications.map((x) => AppNotification.fromJson(x)),
        ),
      );
    }
    _updateUnreadCount();
  }

  static void addNotification({
    required String title,
    required String message,
    String? payLoad,
  }) {
    notifications.add(
      AppNotification(
        title: title,
        message: message,
        timeStamp: DateTime.now().toUtc(), // Store UTC timestamp
        payload: payLoad,
      ),
    );
    _saveNotifications();
    unreadCount.value++; // Automatically increase unread count
  }

  static List<AppNotification> getAllNotifications() {
    return notifications.toList();
  }

  static void markAllAsRead() {
    for (var notification in notifications) {
      notification.isRead = true;
    }
    _saveNotifications();
    _updateUnreadCount();
  }

  static void clearAllNotifications() {
    notifications.clear();
    final box = GetStorage();
    box.remove("notifications");
    unreadCount.value = 0;
  }

  static void removeNotification(int index) {
    notifications.removeAt(index);
    _saveNotifications();
    _updateUnreadCount();
  }

  static void _saveNotifications() {
    final box = GetStorage();
    box.write("notifications", notifications.map((n) => n.toJson()).toList());
  }

  static void _updateUnreadCount() {
    unreadCount.value = notifications.where((n) => !n.isRead).length;
  }
}

class AppNotification {
  final String title;
  final String message;
  final DateTime timeStamp;
  final String? payload;
  bool isRead;

  AppNotification({
    required this.title,
    required this.message,
    DateTime? timeStamp,
    this.isRead = false,
    this.payload,
  }) : timeStamp = timeStamp ?? DateTime.now().toUtc();

  AppNotification.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        payload = json['payload'],
        message = json['message'],
        timeStamp = DateTime.parse(json['timeStamp']).toUtc(), // Convert to UTC
        isRead = json['isRead'] ?? false;

  Map<String, dynamic> toJson() => {
        'title': title,
        'message': message,
        'timeStamp': timeStamp.toIso8601String(),
        'isRead': isRead,
        'payload': payload,
      };
}
