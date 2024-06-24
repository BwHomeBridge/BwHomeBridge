import 'package:bw_home_bridge/backend/mock_data/property_mock.dart';
import 'package:bw_home_bridge/backend/models/property.dart';

class PropertyRepository {
  Future<List<Property>> searchProperties({
    String? location,
    double? minPrice,
    double? maxPrice,
    int? minBedrooms,
    int? maxBedrooms,
  }) async {
    await Future.delayed(Duration(seconds: 2));
    var propertyList = generateMockProperties(100);
    return propertyList;
  }
}
