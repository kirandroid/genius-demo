import 'dart:async';

import 'package:flutter/material.dart';
import 'package:genius_demo/core/utils/text_style.dart';
import 'package:genius_demo/core/widgets/custom_scaffold.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:genius_demo/core/extensions/context_extension.dart';

class RestaurantScreen extends StatefulWidget {
  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(27.6784883, 85.3109423),
    zoom: 13,
  );

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "RESTAURANT",
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
          Container(
            height: 40,
            color: context.theme.corePalatte.colorPrimary,
            alignment: Alignment.center,
            child: Text(
              "No Credit Card, No Google Places API 🤷",
              style: StyleText.montMedium.copyWith(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
