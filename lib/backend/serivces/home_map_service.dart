import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeMapService {
  GoogleMapController? mapController;
  PageController pageController = PageController(viewportFraction: 0.8);

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void animateToLocation(LatLng location) {
    mapController?.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: location, zoom: 12.0),
    ));
  }

  ///
  Future<BitmapDescriptor> createCustomMarker(String imageUrl) async {
    final Uint8List markerIcon = await _getMarkerIcon(Colors.white, imageUrl);
    return BitmapDescriptor.fromBytes(markerIcon);
  }

  Future<Uint8List> _getMarkerIcon(Color color, String imageUrl) async {
    const double markerWidth = 100.0;
    const double markerHeight = 150.0;
    const double circleRadius = 35.0;

    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()..color = color;

    // Draw the marker shape
    // final Path path = Path()
    //   ..moveTo(markerWidth / 2, 0.0)
    //   ..lineTo(markerWidth, markerHeight - circleRadius)
    //   ..arcToPoint(
    //     Offset(0.0, markerHeight - circleRadius),
    //     radius: Radius.circular(circleRadius),
    //     clockwise: false,
    //   )
    //   ..close();

    // canvas.drawPath(path, paint);

    // Load the network image
    final ui.Image image = await _loadNetworkImage(imageUrl);

    // Draw the circle image at the top
    final Rect oval = Rect.fromCircle(
        center: Offset(markerWidth / 2, circleRadius), radius: circleRadius);
    canvas.clipPath(Path()..addOval(oval));
    canvas.drawImageRect(
      image,
      Rect.fromLTRB(0.0, 0.0, image.width.toDouble(), image.height.toDouble()),
      oval,
      Paint(),
    );

    final ui.Image markerAsImage = await pictureRecorder
        .endRecording()
        .toImage(markerWidth.toInt(), markerHeight.toInt());
    final ByteData? byteData =
        await markerAsImage.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  Future<ui.Image> _loadNetworkImage(String url) async {
    final completer = Completer<ui.Image>();
    final networkImage = NetworkImage(url);

    networkImage.resolve(ImageConfiguration()).addListener(
          ImageStreamListener(
            (ImageInfo info, bool _) => completer.complete(info.image),
            onError: (dynamic exception, StackTrace? stackTrace) {
              completer.completeError(exception, stackTrace);
            },
          ),
        );

    return completer.future;
  }
}
