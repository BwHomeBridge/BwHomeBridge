import 'package:bloc/bloc.dart';
import 'package:bw_home_bridge/backend/di/di.dart';
import 'package:bw_home_bridge/backend/models/property.dart';
import 'package:bw_home_bridge/backend/repositories/property_repo.dart';
import 'package:bw_home_bridge/backend/serivces/home_map_service.dart';
import 'package:bw_home_bridge/utils/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final PropertyRepository repository = getInstance<PropertyRepository>();
  HomeMapService homeMapService = HomeMapService();

  Set<Marker> propertyMakers = <Marker>{};

  HomeCubit() : super(const HomeState.initial());

  Future<void> searchProperties({
    String? location,
    double? minPrice,
    double? maxPrice,
    int? minBedrooms,
    int? maxBedrooms,
  }) async {
    try {
      emit(const HomeState.loading());
      final properties = await repository.searchProperties(
        location: location,
        minPrice: minPrice,
        maxPrice: maxPrice,
        minBedrooms: minBedrooms,
        maxBedrooms: maxBedrooms,
      );

      generateMarkers(properties);

      emit(HomeState.loaded(
        properties,
        ViewType.listView,
      ));
    } catch (e) {
      emit(HomeState.error(e.toString()));
    }
  }

  void toggleView(ViewType viewType) {
    state.maybeWhen(
      loaded: (properties, _) {
        emit(HomeState.loaded(properties, viewType));
      },
      orElse: () {},
    );
  }

  ///
  generateMarkers(List<Property> properties) async {
    propertyMakers.clear();

    await Future.forEach(properties, (property) async {
      var icon = await homeMapService.createCustomMarker(property.photo);
      var marker = Marker(
        markerId: MarkerId(property.id.toString()),
        position: property.location,
        icon: icon,
        onTap: () {},
      );
      propertyMakers.add(marker);
    });
  }
}
