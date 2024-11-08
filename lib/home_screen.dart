import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'incident_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(37.7749, -122.4194); // Center position of the map

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disaster Response'),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.location_city),
            onPressed: () {
              Navigator.pushNamed(context, '/resources'); // Navigate to Resources Screen
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Google Map view
          Container(
            height: 300,
            child: GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
              markers: {
                Marker(
                  markerId: MarkerId('incident1'),
                  position: _center,
                  infoWindow: InfoWindow(
                    title: 'Flood',
                    snippet: 'Severe flooding reported.',
                  ),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueRed,
                  ),
                ),
              },
            ),
          ),
          // Incident feed below the map
          Expanded(
            child: ListView.builder(
              itemCount: 5, // Placeholder for number of incidents
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Flood in Downtown'),
                  subtitle: Text('High severity | 3 hours ago'),
                  leading: Icon(Icons.warning, color: Colors.red),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => IncidentDetailScreen(),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
