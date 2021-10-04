import 'dart:async';
import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:maps_learning/live_vehicle_tracking_model.dart';

class VMap extends StatefulWidget {
  const VMap({Key key}) : super(key: key);

  @override
  _VMapState createState() => _VMapState();
}

class _VMapState extends State<VMap> {
  final _mapController = Completer<GoogleMapController>();
  final Set<Marker> _allMarker = {};

  Future<List<dynamic>> loadString() async {
    var response = await http.get(Uri.parse(
        'http://125.209.77.54:8181/ios/locationVehLiveTracking/JV-7391/KrvpjgKAQyTJlfz05Urijw=='));

    // const response = '''[
    //   {"lat":40.712280,"lng":-74.005174},
    //   {"lat":40.712674,"lng":-74.007819}
    //   ]''';
    final List<dynamic> jsonMap = jsonDecode(response.body);
    return jsonMap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: FutureBuilder<List<dynamic>>(
              future: loadString(),
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                for (int i = 0; i < snapshot.data.length; i++) {
                  final model =
                      LiveVehicleTrackingModel.fromJson(snapshot.data[i]);

                  _allMarker.add(Marker(
                    markerId: MarkerId(i.toString()),
                    position: LatLng(model.lat, model.lng),
                  ));
                }

                return GoogleMap(
                  initialCameraPosition: const CameraPosition(
                      target: LatLng(40.7128, -74.0060), zoom: 1.0),
                  markers: _allMarker,
                  onMapCreated: mapCreated,
                  mapType: MapType.normal,
                  tiltGesturesEnabled: true,
                  compassEnabled: true,
                  rotateGesturesEnabled: true,
                  myLocationEnabled: true,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void mapCreated(controller) {
    _mapController.complete(controller);
  }
}
