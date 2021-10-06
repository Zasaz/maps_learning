import 'package:flutter/foundation.dart';
import 'package:maps_learning/live_vehicle_tracking_model.dart';

class SelectedItemNotifier with ChangeNotifier {
  LiveVehicleTrackingModel item;

  void setSelectedItem(LiveVehicleTrackingModel newItem) {
    item = newItem;
    notifyListeners();
  }
}
