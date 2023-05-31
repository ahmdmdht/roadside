import 'package:firebase_auth/firebase_auth.dart';

String mapKey = 'AIzaSyBTzq2N7oKgdbHluaHRDAApQjAJKSYH488';
String mapKey2 = 'AIzaSyAi4yKthIBU-bHeuQHPgpJmdXnuLxKGc1s';


User? firebaseUser;
User? userCurrentInfo;

User? currentfirebaseUser;
const suggestionsBaseUrl =
    'https://maps.googleapis.com/maps/api/place/autocomplete/json';
const placeLocationBaseUrl =
    'https://maps.googleapis.com/maps/api/place/details/json';
const directionsBaseUrl =
    'https://maps.googleapis.com/maps/api/directions/json';