library config;

class Config {
  static AppSettings get appsettings => AppSettings();
  static EndPoints get endpoints => EndPoints();
}

class AppSettings {
  String get appname => 'BwHomeBridge';
  String get version => '1.0.0+1';
}

class EndPoints {
  final String dev = 'https://127.0.0.1/';
  final String test = 'https://127.0.0.1/';
  final String production = 'https://127.0.0.1/';
  String get active => dev;
}
