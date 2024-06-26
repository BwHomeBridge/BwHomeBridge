import 'package:bw_home_bridge/backend/cubits/home/home_cubit.dart';
import 'package:bw_home_bridge/ui/screens/home/grid_view/home_grid_view_screen.dart';
import 'package:bw_home_bridge/ui/screens/home/map_view/home_map_view_screen.dart';
import 'package:bw_home_bridge/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  ///
  // var propertyList = generateMockProperties(100);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: Text('Enter search criteria')),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (properties, viewType) {
            return viewType == ViewType.mapView
                ? HomeMapViewScreen(properties: properties)
                : HomeGridViewScreen(properties: properties);
          },
          error: (message) => Center(child: Text(message)),
        );
      },
    );
  }
}
