import 'dart:math';
import '../utils/constants.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

Map<String, double> calculateMidpoint() {
    if (persons.isEmpty) {
      throw ArgumentError('The persons list cannot be empty.');
    }

    double x = 0.0;
    double y = 0.0;
    double z = 0.0;

    int count = 0;

    for (var person in persons) {
      if (person.locations.isNotEmpty) {
        // Get the 0th location
        var location = person.locations[0];

        // Convert latitude and longitude from degrees to radians
        double lat = location.latitude * pi / 180;
        double lng = location.longitude * pi / 180;

        // Convert to Cartesian coordinates (x, y, z)
        x += cos(lat) * cos(lng);
        y += cos(lat) * sin(lng);
        z += sin(lat);

        count++;
      }
    }

    // Calculate the average Cartesian coordinates
    x /= count;
    y /= count;
    z /= count;

    // Convert the averaged Cartesian coordinates back to latitude and longitude
    double hyp = sqrt(x * x + y * y);
    double lat = atan2(z, hyp) * 180 / pi;
    double lng = atan2(y, x) * 180 / pi;

    // Return the coordinates as a Map with degrees
    return {
      'latitude': lat,
      'longitude': lng,
    };
  }

Map<String, double> midpoint = calculateMidpoint();
final double midOfLati = midpoint['latitude'] ?? 0.0;
final double midOfLongi = midpoint['longitude'] ?? 0.0;


final LatLng midpointLatLng = LatLng(midOfLati, midOfLongi);