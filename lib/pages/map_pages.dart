import 'package:api_key_class/controllers/map_controller.dart';
import 'package:api_key_class/widgets/custom_map.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class MapPage extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Get.put(MapController());
    final MapController mapController = Get.find();

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search For a place",
                suffixIcon: IconButton(
                  onPressed: () {
                    String address = searchController.text;
                    mapController.searchAndNavigate(address);
                  },
                  icon: Icon(Icons.search),
                ),
              ),
            ),
          ),
          Expanded(child: CustomMap())
        ],
      ),
    );
  }
}
