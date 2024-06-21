import 'dart:math';

import 'package:bw_home_bridge/backend/models/property.dart';

List<String> imageUrls = [
  'https://images.pexels.com/photos/323780/pexels-photo-323780.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
  'https://images.pexels.com/photos/731082/pexels-photo-731082.jpeg?auto=compress&cs=tinysrgb&w=800',
  'https://images.pexels.com/photos/2640604/pexels-photo-2640604.jpeg?auto=compress&cs=tinysrgb&w=800'
];

Random random = Random();

List<String> getRandomImages() {
  int count = random.nextInt(imageUrls.length) + 1; // Ensure at least 1 image
  imageUrls.shuffle();
  return imageUrls.take(count).toList();
}

List<Property> generateMockProperties(int count) {
  return List<Property>.generate(count, (index) {
    return Property(
      id: index.toString(),
      name: 'Property ${index + 1}',
      location: 'Location ${index + 1}',
      price: (random.nextDouble() * 10000).roundToDouble(),
      description: 'Description for Property ${index + 1}',
      images: getRandomImages(),
    );
  });
}
