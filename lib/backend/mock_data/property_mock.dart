// import 'dart:math';

// import 'package:bw_home_bridge/backend/models/property.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// List<String> imageUrls = [
//   'https://images.pexels.com/photos/323780/pexels-photo-323780.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
//   'https://images.pexels.com/photos/731082/pexels-photo-731082.jpeg?auto=compress&cs=tinysrgb&w=800',
//   'https://images.pexels.com/photos/2640604/pexels-photo-2640604.jpeg?auto=compress&cs=tinysrgb&w=800'
// ];

// Random random = Random();

// List<String> getRandomImages() {
//   int count = random.nextInt(imageUrls.length) + 1; // Ensure at least 1 image
//   imageUrls.shuffle();
//   return imageUrls.take(count).toList();
// }

// LatLng getRandomLocation() {
//   // Generate random latitude and longitude values
//   double latitude = random.nextDouble() * 180 - 90; // Latitude range: -90 to 90
//   double longitude =
//       random.nextDouble() * 360 - 180; // Longitude range: -180 to 180
//   return LatLng(latitude, longitude);
// }

// List<Property> generateMockProperties(int count) {
//   return List<Property>.generate(count, (index) {
//     return Property(
//       id: index,
//       title: 'Property ${index + 1}',
//       location: getRandomLocation(),
//       price: (random.nextDouble() * 10000).roundToDouble().toString(),
//       description:
//           'Discover your dream home with this stunning 4-bedroom, 3-bathroom residence nestled in a highly sought-after neighborhood. Boasting 2,500 square feet of meticulously designed living space, this home perfectly blends modern comforts with timeless elegance.',
//       images: getRandomImages(), photo: '',
//     );
//   });
// }
