import 'package:uuid/uuid.dart';

extension UniqueKeyExtension on String {
  static final Uuid _uuid = Uuid();

  /// Generates a unique key string (UUID v4)
  static String uniqueKey() {
    return _uuid.v4();
  }
}
