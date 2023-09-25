// // // import 'dart:async';

// // // import 'package:flutter/material.dart';
// // // import 'package:google_maps_flutter/google_maps_flutter.dart';
// // // import 'package:location/location.dart';

// // // class ViaMap extends StatefulWidget {
// // //   const ViaMap({Key? key}) : super(key: key);

// // //   @override
// // //   State<ViaMap> createState() => _HomePageState();
// // // }

// // // class _HomePageState extends State<ViaMap> {
// // //   Completer<GoogleMapController> _googleMapController = Completer();
// // //   CameraPosition? _cameraPosition;
// // //   Location? _location;
// // //   LocationData? _currentLocation;

// // //   @override
// // //   void initState() {
// // //     _init();
// // //     super.initState();
// // //   }

// // //   _init() async {
// // //     _location = Location();
// // //     _cameraPosition = CameraPosition(
// // //         target: LatLng(
// // //             23, 23), // this is just the example lat and lng for initializing
// // //         zoom: 15);
// // //     _initLocation();
// // //   }

// // //   //function to listen when we move position
// // //   _initLocation() {
// // //     //use this to go to current location instead
// // //     _location?.getLocation().then((location) {
// // //       _currentLocation = location;
// // //     });
// // //     _location?.onLocationChanged.listen((newLocation) {
// // //       _currentLocation = newLocation;
// // //       moveToPosition(LatLng(
// // //           _currentLocation?.latitude ?? 0, _currentLocation?.longitude ?? 0));
// // //     });
// // //   }

// // //   moveToPosition(LatLng latLng) async {
// // //     GoogleMapController mapController = await _googleMapController.future;
// // //     mapController.animateCamera(CameraUpdate.newCameraPosition(
// // //         CameraPosition(target: latLng, zoom: 15)));
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       body: _buildBody(),
// // //     );
// // //   }

// // //   Widget _buildBody() {
// // //     return _getMap();
// // //   }

// // //   Widget _getMarker() {
// // //     return Container(
// // //         width: 40,
// // //         height: 40,
// // //         padding: EdgeInsets.all(2),
// // //         decoration: BoxDecoration(
// // //             color: Colors.white,
// // //             borderRadius: BorderRadius.circular(100),
// // //             boxShadow: [
// // //               BoxShadow(
// // //                   color: Colors.grey,
// // //                   offset: Offset(0, 3),
// // //                   spreadRadius: 4,
// // //                   blurRadius: 6)
// // //             ]),
// // //         child: ClipOval(child: Icon(Icons.man)));
// // //   }

// // //   Widget _getMap() {
// // //     return Stack(
// // //       children: [
// // //         GoogleMap(
// // //           initialCameraPosition: _cameraPosition!,
// // //           mapType: MapType.normal,
// // //           onMapCreated: (GoogleMapController controller) {
// // //             // now we need a variable to get the controller of google map
// // //             if (!_googleMapController.isCompleted) {
// // //               _googleMapController.complete(controller);
// // //             }
// // //           },
// // //         ),
// // //         Positioned.fill(
// // //             child: Align(alignment: Alignment.center, child: _getMarker()))
// // //       ],
// // //     );
// // //   }
// // // }

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class ViaMap extends StatefulWidget {
  const ViaMap({super.key});

  @override
  State<ViaMap> createState() => _ViaMapState();
}

class _ViaMapState extends State<ViaMap> {
  static const LatLng sourceLocation = LatLng(12.842213, 80.154987);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.center, children: [
        Column(children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Card(
              child: Text("Current Location"),
            ),
          )
        ]),
        GoogleMap(
            mapToolbarEnabled: true,
            onMapCreated: (GoogleMapController) {},
            mapType: MapType.terrain,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            initialCameraPosition:
                CameraPosition(target: sourceLocation, zoom: 13.5),
            markers: {
              Marker(markerId: MarkerId("source"), position: sourceLocation),
            }),
      ]),
    );
  }
}
