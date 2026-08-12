import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  static String API_URL = dotenv.env['API_URL'] ?? '';
}
