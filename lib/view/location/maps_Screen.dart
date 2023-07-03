import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_geofire/flutter_geofire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:roadside_assistance/cubit/maps_cubit.dart';
import 'package:roadside_assistance/main.dart';
import 'package:roadside_assistance/view/home_design.dart';
import 'package:roadside_assistance/view/location/configMaps.dart';
import 'package:roadside_assistance/view/location/widgets/distance_and_time.dart';
import 'package:roadside_assistance/view/location/widgets/place_item.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';
import '../../model/PlaceSuggestion.dart';
import '../../model/place.dart';
import '../../model/place_direction.dart';
import '../../remote/location_helper.dart';
import '../components/components.dart';
import '../home_layout.dart';
import 'iot_model.dart';

class CurrentLocationScreen extends StatefulWidget {
  @override
  _CurrentLocationScreenState createState() => _CurrentLocationScreenState();
}

class _CurrentLocationScreenState extends State<CurrentLocationScreen> {
  final databaseReference = FirebaseDatabase.instance.reference();
  List<Map<String, dynamic>> availableUsers = [];
  late StreamController<List<LatLng>> _onlineUsersController;
  DatabaseReference dataRef =
  FirebaseDatabase.instance.reference().child('data');
  DataModel data = DataModel();
  late DatabaseReference userRef;

  //خاصة بقراءة داتا العربية الهاردوير
  //List<Map<String, dynamic>> data = [];

  @override
  void initState() {
    super.initState();
    getMyCurrentLocation();
    retrieveUserLocations();
    //ده الجزء الخاص ب انه ينشئ اوبجكت فالفاير بيز للاونلاين يوزرس المتاحين
    _onlineUsersController = StreamController<List<LatLng>>(
      onListen: () {
        // Get the online users' locations from the Firebase Realtime Database.
        userRef = FirebaseDatabase.instance.ref('users');
        userRef.onValue.listen((event) {
          List<LatLng> locations = [];
          for (var user in event.snapshot.children) {
            LatLng location = LatLng(user
                .child('latitude')
                .value as double,
                user
                    .child('longitude')
                    .value as double);
            locations.add(location);
          }
          _onlineUsersController.add(locations);
        });
      },
    );

    // dataRef.onValue.listen((event) {
    //   DataSnapshot snapshot = event.snapshot;
    //   if (snapshot.value != null) {
    //     setState(() {
    //       data = DataModel.fromSnapshot(snapshot);
    //
    //     });
    //   }
    // });
    /////////////////////////////////////////
    // dataRef.onValue.listen((event) {
    //   DataSnapshot snapshot = event.snapshot;
    //   if (snapshot.value != null) {
    //     setState(() {
    //       data = DataModel.fromSnapshot(snapshot);
    //     });
    //     _showUpdatedDataModelDialog(data);
    //   }
    // });
    /////////////////////////////////
    // dataRef.onValue.listen((event) {
    //   DataSnapshot snapshot = event.snapshot;
    //   if (snapshot.value != null) {
    //     DataModel newData = DataModel.fromSnapshot(snapshot);
    //     if (newData.latitude != data.latitude || newData.longitude != data.longitude) {
    //       setState(() {
    //         data = newData;
    //       });
    //       _showUpdatedDataModelDialog(data);
    //     }
    //   }
    // });
  }


  // DatabaseReference userRef = FirebaseDatabase.instance.ref().child('users/online_statues');
  // void initState() {
  //   super.initState();
  //   userRef.onValue.listen((event) {
  //     // Get the list of users who are online.
  //     final List<String> onlineUsers = event.snapshot.value as List<String>;
  //
  //     // Update the map screen to show the users who are online.
  //     setState(() {
  //       onlineUsers.forEach((user) {
  //         // Get the user's location from the database.
  //         final LatLng userLocation = userRef.child(user).child('location').value;
  //
  //         // Add a marker to the map for the user's location.
  //         Marker marker = Marker(
  //           position: userLocation,
  //           icon: BitmapDescriptor.defaultMarker,
  //         );
  //
  //         googleController.addMarker(marker);
  //       });
  //     });
  //   });
  // }

  GlobalKey key = GlobalKey();
  List<PlaceSuggestion> places = [];
  static Position? position;
  Completer<GoogleMapController> googleMapController = Completer();
  late GoogleMapController googleController;
  FloatingSearchBarController controller = FloatingSearchBarController();
  static final CameraPosition initialCameraPosition = CameraPosition(
    // دول خطوط الطول وخطوط العرض بتوع اللوكيشن بتوعي
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14);
  Set<Marker> markers = {};
  late PlaceSuggestion placeSuggestion;
  late Place selectedPlace;
  late Marker searchedPlaceMarker;
  late Marker currentLocationMarker;
  late CameraPosition goToSearchedForPlace;

  void buildCameraNewPosition() {
    goToSearchedForPlace = CameraPosition(
      bearing: 0.0,
      tilt: 0.0,
      target: LatLng(
        selectedPlace.result.geometry.location.lat,
        selectedPlace.result.geometry.location.lng,
      ),
      zoom: 13,
    );
  }

  // these variables for getDirections
  PlaceDirections? placeDirections;
  var progressIndicator = false;
  late List<LatLng> polylinePoints;
  var isSearchedPlaceMarkerClicked = false;
  var isTimeAndDistanceVisible = false;
  late String time;
  late String distance;

  // @override
  // initState() {
  //   super.initState();
  //   getMyCurrentLocation();
  // }

//بي check لو فاتخ اللوكيشن gps بيجبلي اللوكيشن اللايف
  Future<void> getMyCurrentLocation() async {
    //
    position = await LocationHelper.getCurrentLocation().whenComplete(() {
      setState(() {});
    });
  }

  Widget buildMap() {
    return GoogleMap(
      //   markers: _onlineUsersController.stream
      //       .map((locations) => locations
      //       .map((location) => Marker(position: location))
      //       .toList())
      //       .listen(
      //         (markers) => {
      //       setState(() {
      //         // Update the markers on the GoogleMap.
      //       })
      //     },
      //   ),
      // ),
      initialCameraPosition: initialCameraPosition,
      //اول مالخريطه تفتح يجبلي اللايف لوكيشن بتاعي
      myLocationButtonEnabled: true,
      //الماركر بتاع اللوكيشن بتاعي
      //markers: markers,
      markers: getMarkers(),
      zoomControlsEnabled: false,
      //دول زرار مش محتاجه
      mapType: MapType.normal,
      myLocationEnabled: true,
      //
      onMapCreated: (GoogleMapController controller) {
        googleMapController.complete(controller);
      },
      polylines: placeDirections != null
          ? {
        Polyline(
          polylineId: const PolylineId('my_polyline'),
          color: Colors.black,
          width: 2,
          points: polylinePoints,
        ),
      }
          : {},
    );
  }

//عشان لما تبقي الخريطه جاهزة للعرض لازم يبقي فيه كنترولر عشان اتحكم في عرضها واستدعيها تحت

  Future<void> _goToMyCurrentLocation() async {
    final GoogleMapController controller = await googleMapController.future;
    controller
        .animateCamera(CameraUpdate.newCameraPosition(initialCameraPosition));
  }

  Widget buildDiretionsBloc() {
    return BlocListener<MapsCubit, MapsState>(
      listener: (context, state) {
        if (state is DirectionsLoaded) {
          placeDirections = (state).placeDirections;

          getPolylinePoints();
        }
      },
      child: Container(),
    );
  }

  void getPolylinePoints() {
    polylinePoints = placeDirections!.polylinePoints
        .map((e) => LatLng(e.latitude, e.longitude))
        .toList();
  }

  Widget buildSelectedPlaceLocationBloc() {
    return BlocListener<MapsCubit, MapsState>(
      listener: (context, state) {
        if (state is PlaceLocationLoaded) {
          selectedPlace = (state).place;

          goToMySearchedForLocation();
          getDirections();
        }
      },
      child: Container(),
    );
  }

  void getDirections() {
    BlocProvider.of<MapsCubit>(context).emitPlaceDirections(
      LatLng(position!.latitude, position!.longitude),
      LatLng(selectedPlace.result.geometry.location.lat,
          selectedPlace.result.geometry.location.lng),
    );
  }

  Future<void> goToMySearchedForLocation() async {
    buildCameraNewPosition();
    final GoogleMapController controller = await googleMapController.future;
    controller
        .animateCamera(CameraUpdate.newCameraPosition(goToSearchedForPlace));
    buildSearchedPlaceMarker();
  }

  void buildSearchedPlaceMarker() {
    searchedPlaceMarker = Marker(
      position: goToSearchedForPlace.target,
      markerId: MarkerId('1'),
      onTap: () {
        buildCurrentLocationMarker();
        // show time and distance
        setState(() {
          isSearchedPlaceMarkerClicked = true;
          isTimeAndDistanceVisible = true;
        });
      },
      infoWindow: InfoWindow(title: "${placeSuggestion.description}"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );

    addMarkerToMarkersAndUpdateUI(searchedPlaceMarker);
  }

  void buildCurrentLocationMarker() {
    currentLocationMarker = Marker(
      position: LatLng(position!.latitude, position!.longitude),
      markerId: MarkerId('2'),
      onTap: () {},
      infoWindow: InfoWindow(title: "Your current Location"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );
    addMarkerToMarkersAndUpdateUI(currentLocationMarker);
  }

  void addMarkerToMarkersAndUpdateUI(Marker marker) {
    setState(() {
      markers.add(marker);
    });
  }

  void getPlacesSuggestions(String query) {
    final sessionToken = Uuid().v4();
    BlocProvider.of<MapsCubit>(context)
        .emitPlaceSuggestions(query, sessionToken);
  }

  Widget buildSuggestionsBloc(context) {
    return BlocBuilder<MapsCubit, MapsState>(
      builder: (context, state) {
        if (state is PlacesLoaded) {
          places = (state).places;
          if (places.length != 0) {
            return buildPlacesList();
          } else {
            return Container();
          }
        } else {
          return Container();
        }
      },
    );
  }

  Widget buildPlacesList() {
    return ListView.builder(
        itemBuilder: (ctx, index) {
          return InkWell(
            onTap: () async {
              placeSuggestion = places[index];
              controller.close();
              getSelectedPlaceLocation();
            },
            child: PlaceItem(
              suggestion: places[index],
            ),
          );
        },
        itemCount: places.length,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics());
  }

  void removeAllMarkersAndUpdateUI() {
    setState(() {
      markers.clear();
    });
  }

  void getSelectedPlaceLocation() {
    final sessionToken = Uuid().v4();
    BlocProvider.of<MapsCubit>(context)
        .emitPlaceLocation(placeSuggestion.placeId, sessionToken);
  }

  //ده عشان اعمل dialog لما اضغط عاللوكيشين يجبلي المابة
  void openLocationOnMap(String locationUrl) async {
    if (await canLaunch(locationUrl)) {
      await launch(locationUrl);
    } else {
      print('Could not launch $locationUrl');
    }
  }

  void showLocationAlarm(String location) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: AlertDialog(
            backgroundColor: Colors.transparent,
            title: Text('Location Update'),
            content: Text('The location has been updated to: $location'),
            actions: [
              MaterialButton(
                color: Colors.transparent,
                child: Text('Open in Maps'),
                onPressed: () {
                  openLocationOnMap(location);
                  Navigator.of(context).pop();
                },
              ),
              MaterialButton(
                color: Colors.transparent,
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildFloatingSearchBar() {
    final isPortrait =
        MediaQuery
            .of(context)
            .orientation == Orientation.portrait;

    return FloatingSearchBar(
      hint: 'Search...',
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      progress: progressIndicator,
      onQueryChanged: (query) {
        // Call your model, bloc, controller here.
        getPlacesSuggestions(query);
      },
      onFocusChanged: (_) {
        // hide distance and time row
        setState(() {
          isTimeAndDistanceVisible = false;
        });
      },

      // Specify a custom transition to be used for
      // animating between opened and closed stated.
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.place),
            onPressed: () {},
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.white,
            elevation: 4.0,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              buildSuggestionsBloc(context),
              buildSelectedPlaceLocationBloc(),
              buildDiretionsBloc(),
            ]),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          position != null
              ? buildMap()
              : Center(
            child: Container(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            ),
          ),
          buildFloatingSearchBar(),
          // Positioned(
          //   top: 3,
          //   left: 5,
          //   right: 5,
          //   child: SearchLocationWidget(
          //       mapController: googleController,
          //       pickedAddress: locationController.pickAddress,
          //       isEnabled: null),
          // ),

          isSearchedPlaceMarkerClicked
              ? DistanceAndTime(
            isTimeAndDistanceVisible: isTimeAndDistanceVisible,
            placeDirections: placeDirections,
          )
              : Container(),

          // Positioned(
          //   bottom: 100,
          //   top: 600,
          //   right: 200,
          //   left: 0,
          //   child: GestureDetector(
          //     onTap: () async {
          //       final url =
          //           'https://www.google.com/maps/search/?api=1&query=${data.latitude},${data.longitude}';
          //       if (await canLaunch(url)) {
          //         await launch(url);
          //       } else {
          //         throw 'Could not launch $url';
          //       }
          //     },
          //     child: Text(
          //       data.location!,
          //       style: TextStyle(
          //         color: Colors.blue,
          //         decoration: TextDecoration.underline,
          //       ),
          //     ),
          //   ),),
          //   // child: GestureDetector(
          //   //
          //   //   onTap: () async {
          //   //     if (await canLaunch(data.location!)) {
          //   //       await launch(data.location!);
          //   //     } else {
          //   //       throw 'Could not launch ${data.location}';
          //   //     }
          //   //   },
          //   //   child: Text(
          //   //     data.location!,
          //   //     style: TextStyle(
          //   //       color: Colors.blue,
          //   //       decoration: TextDecoration.underline,
          //   //     ),
          //   //   ),
          //   // ),
          // ),
          Positioned(

              top: 570,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(

                margin: EdgeInsets.fromLTRB(0, 0, 8, 10),
                child: IconButton(

                  onPressed: () {
                    makeUserOnlineNow();
                    getLocationLiveUpdates();
                  },
                  icon: Icon(Icons.verified_user, color: Colors.deepOrange),

                ),
              )),
          ///////////////////////////
    //       Positioned(
    //         bottom: 10,
    //         left: 0,
    //         right: 0,
    //
    //         child: Container(
    //           width: 70,
    //           decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(8), color: Colors.transparent,
    //           ),
    //           child: MaterialButton(
    //             onPressed:(){
    //               Navigator.push(context, MaterialPageRoute(builder:(context) => homeDesign()));
    // },
    //             child: Text(
    //               "Get Help!",
    //               style: TextStyle(
    //                   fontSize: 20,
    //                   fontWeight: FontWeight.bold,
    //                   color: Colors.blue),
    //             ),
    //           ),
    //         ),
    //       ),
        ],
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 8, 30),
        child: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: _goToMyCurrentLocation,
          child: Icon(Icons.place, color: Colors.white),
        ),
      ),
    );
  }

//دول تو فانكشنز عشان واحد ينشئ الاونلاين يوزر فالفاير بيز وفانكشن بتعمل ابديت باللوكيشن
  void makeUserOnlineNow() async {
    Geofire.initialize("availableUsers");
    Geofire.setLocation(
        currentfirebaseUser!.uid, position!.latitude, position!.longitude);
    rideRequestRef.onValue.listen((event) {});
  }

  void getLocationLiveUpdates() {
    StreamSubscription<Position> streamSubscription;
    streamSubscription =
        Geolocator.getPositionStream().listen((Position position) {
          position = position;
          Geofire.setLocation(
              currentfirebaseUser!.uid, position.latitude, position.longitude);
          LatLng latLng = LatLng(position.latitude, position.longitude);
        });
  }

  Set<Marker> getMarkers() {
    for (var user in availableUsers) {
      LatLng userLocation = LatLng(user['latitude'], user['longitude']);
      Marker marker = Marker(
        markerId: MarkerId(user['userId']),
        position: userLocation,
        // Add any other desired properties for the marker
      );
      markers.add(marker);
    }
    return markers;
  }

  void retrieveUserLocations() {
    databaseReference
        .child('availableUsers')
        .onValue
        .listen((event) {
      if (event.snapshot.value != null) {
        Map<dynamic, dynamic> users = event.snapshot.value as Map;
        print('allloooo');
        print(users);
        users.forEach((key, value) {
          Map<String, dynamic> userData = {
            'userId': key,
            'latitude': value['l'][0],
            'longitude': value['l'][1],
          };
          setState(() {
            availableUsers.add(userData);
          });
          print('1238488');
          print(availableUsers);
        });
      }
    });
  }

  // void retrieveLocations() {
  //   databaseReference.child('data').onValue.listen((event) {
  //     if (event.snapshot.value != null) {
  //       Map<dynamic, dynamic> locations = event.snapshot.value as Map;
  //       //List<DataModel> newDataList = [];
  //       locations.forEach((key, value) {
  //         //newDataList.add(DataModel.fromSnapshot(value));
  //         Map<String, dynamic> dataList = {
  //           'Impact Message': key,
  //           'Latitude':value,
  //           'Location': value,
  //           'Longitude': value,
  //
  //         };
  //       });
  //       setState(() {
  //         dataList;
  //       });
  //     }
  //   });
  // }
  void retrieveLocationIot() {
    DatabaseReference dataRef =
    FirebaseDatabase.instance.reference().child('data');

    dataRef.onValue.listen((event) {
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        data = DataModel.fromSnapshot(snapshot);
      }
    });
  }
//   void _launchWebUrl(String url) async {
//     if (await canLaunch(url)) {
//       // ignore: deprecated_member_use
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
// }
/////////////////////////////////////////////////////////////

  // void _showUpdatedDataModelDialog(DataModel data) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Updated Data Model'),
  //         content: SingleChildScrollView(
  //           child: ListBody(
  //             children: <Widget>[
  //               Text('car accidient in this location '),
  //
  //               Text('Click here'),
  //               TextButton(
  //                   onPressed: ()async{
  //                     final Uri url = Uri.parse('https://www.google.com/maps/search/?api=1&query=${data.latitude},${data.longitude}');
  //
  //               if (!await launchUrl(url)) {
  //                 throw Exception('Could not launch $url');
  //               }
  //               } ,
  //                   child: Text(data.location!)),
  //             ],
  //           ),
  //         ),
  //         actions: <Widget>[
  //           TextButton(
  //             child: Text('OK'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}