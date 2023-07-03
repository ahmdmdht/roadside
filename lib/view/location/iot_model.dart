import 'package:firebase_database/firebase_database.dart';

class DataModel {
  String? impactMessage;
  String? latitude;
  String? longitude;
  String? location;

  DataModel({this.impactMessage, this.latitude, this.longitude, this.location});

  factory DataModel.fromSnapshot(DataSnapshot snapshot) {
    return DataModel(
      impactMessage: (snapshot.value as Map)["Impact Message"],
      latitude: (snapshot.value as Map)["Latitude"],
      longitude: (snapshot.value as Map)["Longitude"],
      location: (snapshot.value as Map)["Location"],
    );
  }
}