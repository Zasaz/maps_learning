import 'package:flutter/material.dart';
import 'package:maps_learning/live_vehicle_tracking_model.dart';

class SelectedItem extends StatelessWidget {
  final LiveVehicleTrackingModel item;

  const SelectedItem({
    Key key,
    @required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SizedBox(
        height: 100.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('LAT: ${item.lat}'),
            const Text(' - '),
            Text('LNG: ${item.lng}'),
          ],
        ),
      ),
    );
  }
}
