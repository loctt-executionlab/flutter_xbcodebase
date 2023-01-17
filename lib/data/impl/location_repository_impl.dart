import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xbcodebase/domain/models/map_location.dart';
import 'package:xbcodebase/domain/repositories/location_repository.dart';

part 'location_repository_impl.g.dart';

class LocationRepositoryImpl implements LocationRepository {
  @override
  Future<MapLocation> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
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
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    final position = await Geolocator.getCurrentPosition();
    return MapLocation(
      lat: position.latitude,
      lng: position.longitude,
    );
  }
}

@riverpod
LocationRepository locationRepository(LocationRepositoryRef ref) {
  return LocationRepositoryImpl();
}
