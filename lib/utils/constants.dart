import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/person.dart';

// Constants for persons and their locations
final List<Person> persons = [
  Person(
    name: 'Jhonson',
    imagePath: 'assets/person1.png',
    locations: [
      LatLng(-27.487208,153.039854),
      LatLng(-27.47,153.02),
      LatLng(-27.484,153.034),
     
      // Add more LatLng points as needed
    ],
    time: ["in: 7:00 PM out: 10:00 PM", "in: 5:00 PM out: 7:00 PM", "in: 3:00 PM out: 7:00 PM",]
  ),
  Person(
    name: 'Shubham',
    imagePath: 'assets/person2.png',
    locations: [
      LatLng(-27.492447,153.034962),
      LatLng(-27.48,153.02),
      LatLng(-27.49244,153.0349),

      // Add more LatLng points as needed
    ],
    time: ["in: 5:00 PM out: 7:00 PM", "in: 5:00 PM out: 3:00 PM", "in: 9:00 AM out: 3:00 PM"]
  ),
  Person(
    name: 'Rik',
    imagePath: 'assets/person3.png',
    locations: [
      LatLng(-27.484436,153.031580),
      // Add more LatLng points as needed
    ],
    time: ["in: 10:00 AM"]
  ),
  Person(
    name: 'Bob',
    imagePath: 'assets/person4.png',
    locations: [
      LatLng(-27.474839,153.035954),
      LatLng(-27.45,153.0345),
      // Add more LatLng points as needed
    ],
    time: ["in: 7:00 PM out: 10:00 PM", "in: 5:00 PM out: 7:00 PM"]
  ),
  Person(
    name: 'David',
    imagePath: 'assets/person5.png',
    locations: [
      LatLng(-27.479125,153.047337),
      LatLng(-27.467,153.03),
      LatLng(-27.48,153.0435),
     
      // Add more LatLng points as needed
    ],
    time: ["in: 6:00 PM out: 7:00 PM", "in: 2:00 PM out: 6:00 PM", "in: 9:00 AM out: 2:00 PM"]
  ),
  // Add more Person instances as needed
];
