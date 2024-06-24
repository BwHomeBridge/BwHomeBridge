import 'dart:async';

import 'package:bw_home_bridge/utils/debugBro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class McMap extends StatefulWidget {
  final CameraPosition initialCameraPosition;
  final Function(GoogleMapController controller) onMapCreated;

  final Set<Marker> markers;

  const McMap({
    super.key,
    required this.initialCameraPosition,
    required this.onMapCreated,
    this.markers = const <Marker>{},
  });

  @override
  State<McMap> createState() => _McMapState();
}

class _McMapState extends State<McMap> {
  String? mapStyle;
  bool setStyle = true;
  GoogleMapController? _controller;

  Future<void> getMapStyle() async {
    mapStyle = await rootBundle.loadString('assets/map/map_style.json');

    setState(() {});
  }

  @override
  void initState() {
    getMapStyle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (mapStyle != null && _controller != null && setStyle) {
      try {
        // _controller!.setMapStyle(mapStyle);
        setStyle = false;
        setState(() {});
      } catch (e) {
        logger.e(e);
      }
    }
    return GoogleMap(
      markers: widget.markers,
      mapType: MapType.normal,
      initialCameraPosition: widget.initialCameraPosition,
      onMapCreated: (GoogleMapController controller) {
        _controller = controller;
        widget.onMapCreated(controller);
        setState(() {});
      },
    );
  }
}
