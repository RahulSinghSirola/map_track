import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/person.dart';

// Constants for persons and their locations
final List<Person> persons = [
  Person(
    name: 'Mohit Chauhan',
    imagePath: 'assets/person1.png',
    locations: [
      LatLng(28.948457, 79.905233),
      LatLng(28.939879, 79.899726),
      LatLng(28.931441, 79.932740),
      LatLng(28.972021, 79.927961),
      // Add more LatLng points as needed
    ],
    time: ["in: 7:00 PM out: 10:00 PM", "in: 5:00 PM out: 7:00 PM", "in: 3:00 PM out: 7:00 PM", "in: 10:00 AM out: 3:00 PM",]
  ),
  Person(
    name: 'Karan Aujla',
    imagePath: 'assets/person2.png',
    locations: [
      LatLng(28.946411, 79.920734),
      LatLng(28.932961, 79.926703),
      LatLng(28.955327, 79.933427),
      // Add more LatLng points as needed
    ],
    time: ["in: 5:00 PM out: 7:00 PM", "in: 5:00 PM out: 3:00 PM", "in: 9:00 AM out: 3:00 PM"]
  ),
  Person(
    name: 'Honey Singh',
    imagePath: 'assets/person3.png',
    locations: [
      LatLng(28.945799, 79.913506),
      // Add more LatLng points as needed
    ],
    time: ["in: 10:00 AM"]
  ),
  Person(
    name: 'Badshah',
    imagePath: 'assets/person4.png',
    locations: [
      LatLng(28.955221, 79.908820),
      LatLng(29.001264, 79.927685),
      // Add more LatLng points as needed
    ],
    time: ["in: 7:00 PM out: 10:00 PM", "in: 5:00 PM out: 7:00 PM"]
  ),
  Person(
    name: 'Rafter',
    imagePath: 'assets/person5.png',
    locations: [
      LatLng(28.932485, 79.928640),
      LatLng(28.932971, 79.926711),
      LatLng(28.931881, 79.926670),
      // Add more LatLng points as needed
    ],
    time: ["in: 6:00 PM out: 7:00 PM", "in: 2:00 PM out: 6:00 PM", "in: 9:00 AM out: 2:00 PM"]
  ),
  // Add more Person instances as needed
];
