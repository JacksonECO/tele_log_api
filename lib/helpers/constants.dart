import 'package:dotenv/dotenv.dart' show load, env;

abstract class Constants {
  static init() {
    load('.env');
    // load('debug.env');
  }

  static String get oi => env['oi']!;
}
