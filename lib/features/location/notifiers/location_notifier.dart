import 'package:xbcodebase/data/impl/location_repository_impl.dart';
import 'package:xbcodebase/domain/models/map_location.dart';
import 'package:xbcodebase/domain/repositories/location_repository.dart';
import 'package:xbcodebase/tunnels.dart';
part 'location_notifier.g.dart';

@riverpod
class LocationNotifier extends _$LocationNotifier {
  @override
  FutureOr<MapLocation> build() async {
    return _repository.getCurrentLocation();
  }

  void updateCurrentLocation() async {
    state = AsyncData(await _repository.getCurrentLocation());
  }

  LocationRepository get _repository => ref.read(locationRepositoryProvider);
}
