
library config;
import 'package:flutter_dotenv/flutter_dotenv.dart';


class Config {
  static AppSettings get appsettings => AppSettings();
  static EndPoints get endpoints => EndPoints();
}

class AppSettings {
  String get appname => 'BwHomeBridge';
  String get version => '1.0.0+1';
}

class EndPoints {
  final String dev = dotenv.get('DEV_HOST_URL');
  final String test = dotenv.maybeGet('TEST_HOST_URL')!;
  final String production = dotenv.get('LIVE_HOST_URL');
  String get active => dev;
}


