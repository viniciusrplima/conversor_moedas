
import 'package:conversor_moedas/app/models/currency_model.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  late List<CurrencyModel> currencies;
  late CurrencyModel fromCurrency;
  late CurrencyModel toCurrency;

  final TextEditingController toText;
  final TextEditingController fromText;

  HomeController({required this.toText, required this.fromText}) {
    currencies = CurrencyModel.getCurrencies();
    toCurrency = currencies[0];
    fromCurrency = currencies[1];
  }

  convert() {

    String text = toText.text;
    double value = double.tryParse(text.replaceAll(',', '.')) ?? 1;
    double result = 0;

    if (fromCurrency.name == 'Real') {
      result = value * toCurrency.real;
    } else if (fromCurrency.name == 'Dolar') {
      result = value * toCurrency.dolar;
    } else if (fromCurrency.name == 'Euro') {
      result = value * toCurrency.euro;
    } else if (fromCurrency.name == 'Bitcoin') {
      result = value * toCurrency.bitcoin;
    }

    fromText.text = result.toStringAsFixed(2);
  }
}