import 'package:bloc/bloc.dart';
import 'package:bw_home_bridge/backend/cubits/tender/tender_state.dart';
import 'package:bw_home_bridge/backend/repositories/tenders_repo.dart';

class TenderCubit extends Cubit<TenderState> {
  final TendersRepository tendersRepo = TendersRepository();

  TenderCubit() : super(TenderState.initial());

  Future<void> fetchTenders() async {
    emit(TenderState.loading());
    try {
      final tenders = await tendersRepo.fetchTenders();
      emit(TenderState.loaded(tenders));
    } catch (e) {
      emit(TenderState.error('Failed to fetch tenders'));
    }
  }
}
