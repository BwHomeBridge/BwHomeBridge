import 'package:kiwi/kiwi.dart';

import '../api/api_client.dart';
import '../api/auth_remote_datasource.dart';
import '../api/fault_reporting_remote_datasource.dart';
import '../api/property_remote_datasource.dart';
import '../api/tender_remote_datasource.dart';
import '../repositories/property_repo.dart';

part 'di.g.dart';

abstract class AppConfig {
  static void configureDependency() {
    _$AppConfig()._initApp();
  }

  @Register.singleton(ApiClient)
  @Register.singleton(AuthRemoteDatasource)
  @Register.singleton(FaultReportingRemoteDatasource)
  @Register.singleton(PropertyRemoteDatasource)
  @Register.singleton(TenderRemoteDatasource)
  void _configureAppSingleton();

  @Register.singleton(PropertyRepository)
  void _configureFactories();

  void _initApp() {
    _configureAppSingleton();
    _configureFactories();
  }
}

final getInstance = KiwiContainer().resolve;