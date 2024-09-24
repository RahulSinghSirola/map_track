import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/person.dart';

class PersonDetailsScreen extends StatefulWidget {
  final Person person;

  PersonDetailsScreen({required this.person});

  @override
  _PersonDetailsScreenState createState() => _PersonDetailsScreenState();
}

class _PersonDetailsScreenState extends State<PersonDetailsScreen> {
  late GoogleMapController _mapController;
  final Set<Polyline> _polylines = {}; // To store polylines for the path
  final Set<Marker> _markers = {}; // To store markers on the locations
  LatLng _currentLocation = LatLng(0, 0); // Current location shown on the map
  bool _showPath = false; // Determines whether to show a path between locations or not

  @override
  void initState() {
    super.initState();
    _currentLocation = widget.person.locations[0]; // Default to the first location
    _addMarker(_currentLocation, widget.person.name); // Add marker for the first location
  }

  // On map created, we initialize the map controller
  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  // Function to add marker on the map
  void _addMarker(LatLng position, String markerId) {
    _markers.add(
      Marker(
        markerId: MarkerId(markerId),
        position: position,
        infoWindow: InfoWindow(title: markerId),
      ),
    );
  }

  // Function to show the path between two contiguous locations
  void _showPathBetweenLocations(int index) {
    if (index < widget.person.locations.length - 1) {
      // If not the last location, show a polyline between the current and next location
      final LatLng start = widget.person.locations[index];
      final LatLng end = widget.person.locations[index + 1];

      setState(() {
        _currentLocation = start; // Focus on the clicked location
        _showPath = true; // Show path
        _polylines.clear(); // Clear previous polylines
        _markers.clear(); // Clear previous markers

        // Add new markers for both locations involved in the path
        _addMarker(start, '${widget.person.name}_$index');
        _addMarker(end, '${widget.person.name}_${index + 1}');

        // Add the polyline between start and end locations
        _polylines.add(
          Polyline(
            polylineId: PolylineId('path_${index}_${index + 1}'),
            visible: true,
            points: [start, end],
            width: 5,
            color: const Color.fromARGB(255, 7, 204, 20),
          ),
        );
      });
    } else {
      // If it's the last location, don't show a path, just focus on the first location
      setState(() {
        _currentLocation = widget.person.locations[0];
        _showPath = false; // Don't show any path
        _polylines.clear(); // Clear polylines
        _markers.clear(); // Clear previous markers

        // Add marker for the first location again
        _addMarker(widget.person.locations[0], '${widget.person.name}_0');
      });
    }

    // Move the map camera to the selected location
    _mapController.animateCamera(
      CameraUpdate.newLatLng(_currentLocation),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.person.name}\'s History'),
        backgroundColor: Color.fromARGB(255, 0, 44, 139),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Map section, occupying half of the screen height
          Expanded(
            flex: 1,
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _currentLocation,
                zoom: 12,
              ),
              markers: _markers, // Display the markers
              polylines: _polylines, // Show the polylines if any
            ),
          ),
          // ListView for location history, occupying the other half of the screen height
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey[200], // Background color for the list view section
              child: ListView.builder(
                itemCount: widget.person.locations.length,
                itemBuilder: (context, index) {
                  final location = widget.person.locations[index];
                  final time = widget.person.time[index];
                  return ListTile(
                    leading: Icon(Icons.location_on, color: Colors.purple),
                    title: Text('Location ${index + 1}'),
                    subtitle: Text('Lat: ${location.latitude}, Lng: ${location.longitude}\n${time}'),
                    onTap: () => _showPathBetweenLocations(index), // Handle tap to show path
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
