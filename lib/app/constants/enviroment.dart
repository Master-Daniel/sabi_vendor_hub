import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppEnvironment {
  static String API_URL = dotenv.env['API_BASE_URL'] ?? "";
  static String GOOGLE_MAPS_API_KEY =  dotenv.env['GOOGLE_MAPS_API_KEY'] ?? "";
  static String GOOGLE_AUTH_CLIENT_ID =  dotenv.env['GOOGLE_CLIENT_ID'] ?? "";
  static String REVENUE_CAT_API_KEY_ANDROID =  dotenv.env['REVENUE_CAT_API_KEY_ANDROID'] ?? "";
  static String REVENUE_CAT_API_KEY_IOS =  dotenv.env['REVENUE_CAT_API_KEY_IOS'] ?? "";
}