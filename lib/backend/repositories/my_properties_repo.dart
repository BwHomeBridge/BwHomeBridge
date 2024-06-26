import 'package:bw_home_bridge/backend/models/rent_payment.dart';
import 'package:bw_home_bridge/backend/models/user_property.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyPropertiesRepository {
  Future<List<UserProperty>> fetchMyProperties() async {
    return _properties;
  }
}

// Mock data for demonstration
final List<UserProperty> _properties = [
  UserProperty(
    id: 1,
    title: 'Beautiful House',
    location: LatLng(37.7749, -122.4194),
    price: '500,000 USD',
    images: [
      'https://images.pexels.com/photos/731082/pexels-photo-731082.jpeg?auto=compress&cs=tinysrgb&w=800',
      'https://images.pexels.com/photos/2640604/pexels-photo-2640604.jpeg?auto=compress&cs=tinysrgb&w=800'
    ],
    photo: 'main_photo.jpg',
    description: 'A beautiful house in San Francisco',
    listingType: 'Sale',
    propertyType: 'House',
    isForSale: true,
    rentPaymentHistory: [
      RentPayment(
          id: 1,
          amount: 1500.0,
          date: DateTime.now().subtract(Duration(days: 30))),
      RentPayment(
          id: 2,
          amount: 1500.0,
          date: DateTime.now().subtract(Duration(days: 60))),
    ],
    nextRentDueDate: DateTime.now().add(Duration(days: 10)),
  ),
];
