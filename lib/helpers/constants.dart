import 'package:dotenv/dotenv.dart' show load, env;

abstract class Constants {
  /// Inicia o dotenv com o arquivo do projeto
  static init() {
    load('.env');
    // load('debug.env');
  }

  /// Token de acesso do bot
  static String get teleLogToken => env['telelog_token']!;

  /// Chat Id
  static String get githubConstrutora => env['log_house']!;

  /// Chat Id
  static String get logHouseChat => env['github_construtora']!;

  /// Chat Id
  static String get api0921Status => env['api0921_status']!;

  /// Chat Id
  static String get developChat => env['develop_chat']!;
}
