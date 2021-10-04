class LiveVehicleTrackingModel {
  final double lat;
  final double lng;
  final int speed;
  final double refDist;
  final String refLoc;
  final String accStatus;
  final String recDateTime;
  final String driver;
  final double temperature;
  final String imoblize;

  const LiveVehicleTrackingModel({
    this.lat,
    this.lng,
    this.speed,
    this.refDist,
    this.refLoc,
    this.accStatus,
    this.recDateTime,
    this.driver,
    this.temperature,
    this.imoblize,
  });

  factory LiveVehicleTrackingModel.fromJson(Map<String, dynamic> map) {
    return LiveVehicleTrackingModel(
      lat: map['lat'],
      lng: map['lng'],
      speed: map['speed'],
      refDist: map['refDist'],
      refLoc: map['refLoc'],
      accStatus: map['accStatus'],
      recDateTime: map['recDateTime'],
      driver: map['driver'],
      temperature: map['temperature'],
      imoblize: map['imoblize'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lng': lng,
      'speed': speed,
      'refDist': refDist,
      'refLoc': refLoc,
      'accStatus': accStatus,
      'recDateTime': recDateTime,
      'driver': driver,
      'temperature': temperature,
      'imoblize': imoblize,
    };
  }
}
