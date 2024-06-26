import 'package:bw_home_bridge/backend/cubits/cubit/my_properties_state.dart';
import 'package:bw_home_bridge/backend/repositories/my_properties_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyPropertiesCubit extends Cubit<MyPropertiesState> {
  final MyPropertiesRepository repository = MyPropertiesRepository();

  MyPropertiesCubit() : super(MyPropertiesState.initial());

  Future<void> loadProperties() async {
    emit(MyPropertiesState.loading());
    try {
      final properties = await repository.fetchMyProperties();
      emit(MyPropertiesState.loaded(properties));
    } catch (e) {
      emit(MyPropertiesState.error(e.toString()));
    }
  }
}
