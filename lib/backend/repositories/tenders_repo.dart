import 'package:bw_home_bridge/backend/models/tender.dart';

class TendersRepository {
  Future<List<Tender>> fetchTenders() async {
    await Future.delayed(Duration(seconds: 2));
    return [
      Tender(
        id: '1',
        title: 'Supply And Delivery Of ICT Machines, Botswana - 103010982',
        status: 'Open',
        deadline: DateTime.now().add(Duration(days: 10)),
      ),
      Tender(
        id: '2',
        title: 'Consultancy For Delivery of Skills Programme',
        status: 'Closed',
        deadline: DateTime.now().add(Duration(days: 5)),
      ),
    ];
  }
}
