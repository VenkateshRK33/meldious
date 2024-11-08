import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ResourcesScreen extends StatelessWidget {
  // Define a location for the shelter marker
  final LatLng _shelterLocation = const LatLng(37.7749, -122.4194);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resources & Shelters'),
      ),
      body: Column(
        children: [
          // Map container
          Container(
            height: 300,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _shelterLocation,
                zoom: 11.0,
              ),
              markers: {
                Marker(
                  markerId: MarkerId('shelter1'),
                  position: _shelterLocation,
                  infoWindow: InfoWindow(
                    title: 'Community Shelter',
                    snippet: 'Available space: 200',
                  ),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueBlue,
                  ),
                ),
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Nearby Resources',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: Text('Community Shelter'),
                  subtitle: Text('Capacity: 200 | Open 24/7'),
                  leading: Icon(Icons.home, color: Colors.blue),
                ),
                ListTile(
                  title: Text('Local Hospital'),
                  subtitle: Text('Open for emergency care'),
                  leading: Icon(Icons.local_hospital, color: Colors.red),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
