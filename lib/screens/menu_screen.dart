import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'member_screen.dart';
import '../utils/constants.dart';
import '../methods/midpoint.dart';
import 'person_details_screen.dart'; // Import the PersonDetailsScreen


class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  bool showMemberBar = true;
  bool showMapView = true;
  late GoogleMapController mapController;
  final Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = {};
  bool _isMapControllerCompleted = false; // Add this flag
  @override
  void initState() {
    super.initState();
    _loadMarkers();
  }



  void _loadMarkers() async {
    setState(() {
      for (var person in persons) {
        if (person.locations.isNotEmpty) {
          _markers.add(
              Marker(
                markerId: MarkerId(person.name), // Use person's name as marker ID
                position: person.locations[0],
                // icon:, // Set the custom marker icon
                infoWindow: InfoWindow(title: person.name), // Info window with the person's name
              ),
            );
            setState(() {}); // Call setState to update markers
        }
      }
    });
  }

  // On map created
    void _onMapCreated(GoogleMapController controller) {
    if (!_isMapControllerCompleted) {
      _controller.complete(controller);
      _isMapControllerCompleted = true; // Mark it as completed
    }
  }


  // Toggle between map view and list view
  void _toggleView() {
    setState(() {
      showMapView = !showMapView; // Toggle the state
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ATTENDANCE'),
        backgroundColor: Color.fromARGB(255, 0, 44, 139),
        foregroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 44, 139),
              ),
              child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              title: const Text('Timer'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Attendance'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          if (showMemberBar)
            Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Icon(Icons.group, color: Colors.black),
                  const SizedBox(width: 10),
                  const Text('All Members', style: TextStyle(fontSize: 18, color: Colors.black)),
                  const Spacer(),
                  TextButton(
                    child: Text("Change"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MemberScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          // Conditionally display the map or the list view
          Expanded(
            child: showMapView
                ? GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: midpointLatLng,
                      zoom: 13,
                    ),
                    markers: _markers,
                  )
                : Container(
  color: Color.fromARGB(255, 255, 255, 255), // Background color
  child: ListView.builder(
    itemCount: persons.length,
    itemBuilder: (context, index) {
      final person = persons[index];
      return ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(person.imagePath),
        ),
        title: Text(person.name),
        subtitle: Text('Location Count: ${person.locations.length}\n${person.time[0]}'),
        onTap: () {
          // Navigate to detailed view for the person
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PersonDetailsScreen(person: person),
            ),
          );
        },
      );
    },
  ),
)

          ),
          // Toggle button at the bottom
          Container(
            padding: const EdgeInsets.all(10),
            child: TextButton(
              onPressed: _toggleView,
              child: Text(showMapView ? 'Show List View' : 'Show Map View'),
            ),
          ),
        ],
      ),
    );
  }
}
