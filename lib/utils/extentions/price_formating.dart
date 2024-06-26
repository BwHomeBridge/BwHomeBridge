import 'package:intl/intl.dart';

extension PriceFormatting on num {
  String toBWP() {
    final format = NumberFormat.currency(locale: 'en_BW', symbol: 'P');
    return format.format(this);
  }
}
