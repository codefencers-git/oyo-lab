import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import '../global/flutter_toast.dart';

class UserLocationController extends GetxController {
  Rx<String> currentAddress = "".obs;
  // Rx<bool> isLoading = false.obs;

  Future getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {}

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return showToast('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return showToast(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    var position = await Geolocator.getCurrentPosition();

    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    if (placemarks.isNotEmpty) {
      var tempcurrentLocationCity =
          placemarks[0].subAdministrativeArea != null &&
                  placemarks[0].subAdministrativeArea != ""
              ? placemarks[0].name
              : "";
      currentAddress(tempcurrentLocationCity);
      print("-0-0-0-0-----" + currentAddress.value);
      print("-1-1-1-1-1------" + tempcurrentLocationCity.toString());
    }
  }
}
