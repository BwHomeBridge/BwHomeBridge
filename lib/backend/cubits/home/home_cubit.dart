import 'package:bloc/bloc.dart';
import 'package:bw_home_bridge/backend/di/di.dart';
import 'package:bw_home_bridge/backend/helper_classes/project_filters.dart';
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

  ProjectFilters projectFilters = ProjectFilters();

  Set<Marker> propertyMakers = <Marker>{};

  HomeCubit() : super(const HomeState.initial());

  Future<void> searchProperties() async {
    try {
      emit(const HomeState.loading());
      final properties = await repository.searchProperties(
        location: projectFilters.location,
        minPrice: projectFilters.minPrice,
        maxPrice: projectFilters.maxPrice,
        minBedrooms: projectFilters.minBedrooms,
        maxBedrooms: projectFilters.maxBedrooms,
        propertyType: projectFilters.getPropertyType,
        listingType: projectFilters.getListingType,
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
