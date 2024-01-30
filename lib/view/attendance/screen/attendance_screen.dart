import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_config/config_dimens.dart';
import 'package:engineering_project/core/core_config/config_style.dart';
import 'package:engineering_project/core/core_function/functions.dart';
import 'package:engineering_project/view/menu/screen/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  Position? address;
  late bool isLoading;
  @override
  void initState() {
    super.initState();
    isLoading = true;
    _determinePosition().then((value) {
      setState(() {
        address = value;
        isLoading = false;
      });
    });
  }

  // Future<void> getAddressFromLadLan(Position position) async {
  //   List<Placemark> placeMarks =
  //       await placemarkFromCoordinates(position.latitude, position.longitude);
  //   print(placeMarks.toString());
  //   var place = placeMarks[1];
  //   address =
  //       "${place.street} ${place.subLocality} ${place.locality} ${place.postalCode}";
  // }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    var currentLocation = await Geolocator.getCurrentPosition();
    print(currentLocation);
    return currentLocation;
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        body: Center(
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  Text(
                    "Loading...",
                    style: ConfigStyle.regularStyle(20, LOGIN_BUTTON_COLOR),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        floatingActionButton: MaterialButton(
          color: LOGIN_BUTTON_COLOR,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          onPressed: () {
            Functions.replacementTransition(context, const MenuScreen());
          },
          child: Text(
            "Submit",
            style: ConfigStyle.boldStyle(
              14,
              MATERIAL_COLOR,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: scaleWidth(context) / 20),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      Functions.replacementTransition(
                          context, const MenuScreen());
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 24,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: scaleWidth(context) / 20),
                Text(
                  "Get Your attendance",
                  style: ConfigStyle.boldStyle(
                    22,
                    APP_THEME_COLOR,
                  ),
                ),
                SizedBox(height: scaleWidth(context) / 10),
                Container(
                  height: scaleWidth(context) - 100,
                  width: scaleWidth(context) - 100,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("asset/images/attendance_1.png"),
                    ),
                  ),
                ),
                SizedBox(height: scaleWidth(context) / 10),
                Text(
                  "Your Location",
                  style: ConfigStyle.boldStyle(
                    24,
                    BLACK_HEAVY,
                  ),
                ),
                SizedBox(height: scaleWidth(context) / 20),
                Container(
                  height: 80,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      Functions.buildBoxShadow(),
                    ],
                  ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Latitude : ${address?.latitude ?? "Pending"}",
                          style: ConfigStyle.regularStyle(
                            14,
                            BLACK_LIGHT,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Longitude : ${address?.longitude ?? "Pending"}",
                          style: ConfigStyle.regularStyle(
                            14,
                            BLACK_LIGHT,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
