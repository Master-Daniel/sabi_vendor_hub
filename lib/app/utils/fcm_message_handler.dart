// ignore_for_file: constant_identifier_names



import 'app_logger.dart';


class FcmMessageHandler {
  Future<void> handle(Map<dynamic, dynamic> message) async {
    try {
      appLog(message, "fcm message");

      if (!message['event']) return;
      final String event = message['event'];
      switch (event) {
        case 'NEW_FOLLOWER':
          String followerId = message['followerId'];
          break;
          case 'POSTED_NEW_ITEM':
          String itemId = message['itemId'];
          break;
          case 'POSTED_NEW_REQUEST':
          String requestId = message['requestId'];
          break;
            case 'LIKED_REQUEST':
          String requestId = message['requestId'];
         
          break;
          case 'LIKED_ITEM':
          String itemId = message['itemId'];
         
          break;
        default:
          appLog('Unhandled FCM event: $event');
      }
      appLog('FCM Message Received');
      appLog(event);
    } catch (e) {
      appLog(e);
    }
  }
}
