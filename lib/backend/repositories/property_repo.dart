import 'package:bw_home_bridge/backend/models/property.dart';
import 'package:bw_home_bridge/utils/debugBro.dart';

import '../api/property_remote_datasource.dart';

class PropertyRepository {
  final PropertyRemoteDatasource _propertyRemoteDatasource;

  PropertyRepository(this._propertyRemoteDatasource);

  Future<List<Property>> searchProperties({
    String? location,
    double? minPrice,
    double? maxPrice,
    int? minBedrooms,
    int? maxBedrooms,
  }) async {
   try {
     final properties = await _propertyRemoteDatasource.getProperties(
       location: location,
       minPrice: minPrice,
       maxPrice: maxPrice,
       minBedrooms: minBedrooms,
       maxBedrooms: maxBedrooms,
     );
     logger.i(properties);
     return properties;
   }
    catch (e) {
     logger.e(e);
     return [];
    }
  }
}
