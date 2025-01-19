import 'package:intl/intl.dart';

String formatMoney(double amount, bool hasSymbol) {
  final formatCurrency = NumberFormat.currency(locale: "en_PH", symbol: "₱");

  if (hasSymbol) {
    return "\u20B1${formatCurrency.format(amount)}";
  }

  return NumberFormat('#,##0.00').format(amount);
}