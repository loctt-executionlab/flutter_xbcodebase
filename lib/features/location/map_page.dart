import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:xbcodebase/bridges.dart';
import 'package:xbcodebase/features/location/notifiers/location_notifier.dart';

class MapPage extends HookConsumerWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = ref.watch(locationNotifierProvider);

    return location.when(
      data: (data) {
        debugPrint('asdfasdf');
        return GoogleMap(
          initialCameraPosition:
              CameraPosition(target: LatLng(data.lat, data.lng), zoom: 12),
        );
      },
      error: (error, stackTrace) {
        return Center(
          child: Text('Error occured'),
        );
      },
      loading: () {
        return Center(
          child: Text('Loading map ocured'),
        );
      },
    );
  }
}
