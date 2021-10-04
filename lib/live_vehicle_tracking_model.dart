class LiveVehicleTrackingModel {
  double lat;
  double lng;
  int speed;
  double refDist;
  String refLoc;
  String accStatus;
  String recDateTime;
  String driver;
  double temperature;
  String imoblize;

  LiveVehicleTrackingModel(
      {this.lat,
        this.lng,
        this.speed,
        this.refDist,
        this.refLoc,
        this.accStatus,
        this.recDateTime,
        this.driver,
        this.temperature,
        this.imoblize});

  LiveVehicleTrackingModel.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
    speed = json['speed'];
    refDist = json['refDist'];
    refLoc = json['refLoc'];
    accStatus = json['accStatus'];
    recDateTime = json['recDateTime'];
    driver = json['driver'];
    temperature = json['temperature'];
    imoblize = json['Imoblize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['lng'] = lng;
    data['speed'] = speed;
    data['refDist'] = refDist;
    data['refLoc'] = refLoc;
    data['accStatus'] = accStatus;
    data['recDateTime'] = recDateTime;
    data['driver'] = driver;
    data['temperature'] = temperature;
    data['Imoblize'] = imoblize;
    return data;
  }
}