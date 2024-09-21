import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  var markers = <Marker>[].obs;
  late GoogleMapController googleMapController;

  var mapType = MapType.normal.obs;

  void onMapCreated(GoogleMapController controller) {
    googleMapController = controller;
  }

  void changeMapType(MapType newType) {
    mapType.value = newType;
  }

  // void addMarker(LatLng position) {
  //   markers.clear();
  //   markers.add(Marker(
  //       markerId: MarkerId('current_marker'),
  //       position: position,
  //       infoWindow: InfoWindow(title: "Marker")));

  //   googleMapController.animateCamera(
  //     CameraUpdate.newLatLng(
  //       position,
  //     ),
  //   );
  // }

  Future<void> addMarker(LatLng position) async {
    // Reverse geocoding to get address details
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        String title =
            '${place.locality}, ${place.administrativeArea}, ${place.country}';

        markers.clear(); // Remove any existing markers
        markers.add(
          Marker(
            markerId: MarkerId('searched_location'),
            position: position,
            infoWindow: InfoWindow(
              title: title,
            ),
          ),
        );
      }
    } catch (e) {
      print("Error occurred while adding marker: $e");
    }
  }

  Future<void> searchAndNavigate(String address) async {
    try {
      List<Location> locations = await locationFromAddress(address);
      if (locations.isNotEmpty) {
        Location location = locations.first;
        LatLng target = LatLng(location.latitude, location.longitude);

        addMarker(target);
        googleMapController
            .animateCamera(CameraUpdate.newLatLngZoom(target, 14.0));

        double zoomLevel = 14.0;
        if (address.toLowerCase().contains('America')) {
          zoomLevel = 3.0;
        } else if (address.toLowerCase().contains('india')) {
          zoomLevel = 5.0;
        }

        googleMapController
            .animateCamera(CameraUpdate.newLatLngZoom(target, zoomLevel));
      }
    } catch (e) {
      print("Error occured: $e");
    }
  }
}
