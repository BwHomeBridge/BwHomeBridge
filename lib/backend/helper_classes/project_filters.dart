import 'package:bw_home_bridge/utils/constants.dart';
import 'package:bw_home_bridge/utils/enums.dart';

class ProjectFilters {
  PropertyType _propertyType = PropertyType.all;
  ListingType _listingType = ListingType.all;

  set propertyType(PropertyType type) {
    _propertyType = type;
  }

  PropertyType get propertyType => _propertyType;
  ListingType get listingType => _listingType;

  set listingType(ListingType type) {
    _listingType = type;
  }

//// used to query DB
  ///
////////////////////////////////////////

  String? get getPropertyType {
    if (_propertyType == PropertyType.all) return null;
    return _propertyType.name;
  }

  String? get getListingType {
    if (_listingType == ListingType.all) return null;
    return _listingType.name;
  }

  String? location;
  double minPrice = 0.0;
  double maxPrice = kMaxPrice;
  int? minBedrooms;
  int? maxBedrooms;
}
