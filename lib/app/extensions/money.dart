import 'package:get/get.dart';
import 'package:money_formatter/money_formatter.dart';

extension MoneyFormatting on double {
  String formatMoney(String symbol) {
    MoneyFormatter fmf = MoneyFormatter(
      amount: this,
      settings: MoneyFormatterSettings(
        symbol: symbol,
        fractionDigits: 2,
        decimalSeparator: getDecimalSeparator(),
        thousandSeparator: getThousandSeparator(),
      ),
    );
    return fmf.output.nonSymbol;
  }
}

String getDecimalSeparator() {
  String locale = Get.locale?.languageCode ?? 'en';
  switch (locale) {
    case 'en':
      return '.';
    case 'tr':
      return ',';
    default:
      return '.';
  }
}

String getThousandSeparator() {
  String locale = Get.locale?.languageCode ?? 'en';
  switch (locale) {
    case 'en':
      return ',';
    case 'tr':
      return '.';
    default:
      return ',';
  }
}

extension MoneyFormattingString on String {
  String formatMoney(String? symbol) {
    MoneyFormatter fmf = MoneyFormatter(
      amount: double.tryParse(this) ?? 0.0,
      settings: MoneyFormatterSettings(
        symbol: symbol,
        fractionDigits: 2,
        decimalSeparator: getDecimalSeparator(),
        thousandSeparator: getThousandSeparator(),
      ),
    );
    return fmf.output.nonSymbol;
  }
}
