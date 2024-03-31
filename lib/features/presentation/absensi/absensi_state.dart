import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AbsensiState {
  final latLong = const LatLng(-0.4671636, 117.157565);
  final posisiAbsen = const CameraPosition(
    target: LatLng(-0.4671636, 117.157565),
    zoom: 17.0, //zoom 17x biar lokasi langsung keliatan
  );
  final Completer<GoogleMapController> mapsController = Completer();

  TextEditingController dateController = TextEditingController();
  TextEditingController clockController = TextEditingController();
}
