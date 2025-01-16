import 'package:intl/intl.dart';

String formatMoney(double amount) {
  final formatCurrency = NumberFormat.currency(locale: "en_PH", symbol: "₱");
  return formatCurrency.format(amount);
}