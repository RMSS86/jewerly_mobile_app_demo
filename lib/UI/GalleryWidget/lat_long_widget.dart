import 'package:flutter/material.dart';
import '../../models/Gallery/model/location.dart';

class LatLongWidget extends StatelessWidget {
  final Location location;

  const LatLongWidget({
    required this.location,
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            location.latitude,
            style: TextStyle(color: Colors.white70),
          ),
          Icon(Icons.location_on, color: Colors.white70),
          Text(
            location.longitude,
            style: TextStyle(color: Colors.white70),
          )
        ],
      );
}
