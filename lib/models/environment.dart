import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get fileName {
    return 'assets/env/.env';
  }

  static String? get apiBaseUrl {
    return dotenv.env['API_BASE_URL'];
  }

  static String? get apiKey {
    return dotenv.env['API_KEY'];
  }
}
