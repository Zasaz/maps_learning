import 'package:flutter/material.dart';
import 'package:maps_learning/live_vehicle_tracking_model.dart';
import 'package:provider/provider.dart';

import 'selected_item_notifier.dart';

class SelectedItem extends StatelessWidget {
  const SelectedItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LiveVehicleTrackingModel item = context.watch<SelectedItemNotifier>().item;

    if (item == null) {
      return const SizedBox();
    }

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
