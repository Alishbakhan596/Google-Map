import 'package:api_key_class/controllers/map_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMap extends StatelessWidget {
  const CustomMap({super.key});

  @override
  Widget build(BuildContext context) {
    final MapController mapController = MapController();
    return Obx(
      () => GoogleMap(
        onMapCreated: mapController.onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(22.5937, 78.9629),
          zoom: 5,
        ),
        mapType: mapController.mapType.value,
        markers: mapController.markers.toSet(),
        onTap: (position) {
          mapController.addMarker(position);
        },
      ),
    );
  }
}
