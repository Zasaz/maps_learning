import 'dart:async';
import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class VMap extends StatefulWidget {
  const VMap({Key key}) : super(key: key);

  @override
  _VMapState createState() => _VMapState();
}

class _VMapState extends State<VMap> {
  @override
  void initState() {
    super.initState();
    _future = loadString();
  }

  Future _future;

  Future loadString() async {
    var response = await http.get(Uri.parse(
        'http://125.209.77.54:8181/ios/locationVehLiveTracking/JV-7391/KrvpjgKAQyTJlfz05Urijw=='));
    final dynamic responsebody = jsonDecode(response.body);
    print(responsebody);
    return responsebody;
  }

  List<Marker> allMarkers = [];
  GoogleMapController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: FutureBuilder(
            future: _future,
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              List<dynamic> parsedJson = jsonDecode(snapshot.data);

              allMarkers = parsedJson.map((i) {
                return Marker(
                  markerId: MarkerId(i['speed']),
                  position: LatLng(i['lat'], i['lng']),
                  onTap: () {},
                );
              }).toList();

              return GoogleMap(
                initialCameraPosition: const CameraPosition(
                    target: LatLng(40.7128, -74.0060), zoom: 1.0),
                markers: Set.from(allMarkers),
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
      ]),
    );
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }
}
