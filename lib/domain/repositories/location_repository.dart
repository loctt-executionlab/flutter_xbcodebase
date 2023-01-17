import 'package:xbcodebase/domain/models/map_location.dart';

abstract class LocationRepository {
  Future<MapLocation> getCurrentLocation();
}
