import 'dart:convert';
import 'dart:html';

import 'package:http/http.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  double BTCrate = 0;
  double ETHrate = 0;
  double LTCrate = 0;

  Future btc(
    String selectedCurrency,
  ) async {
    Response response = await get(Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/BTC/$selectedCurrency?apikey=CC2BAAE9-47E8-4A02-92E5-303E9B8221F5'));
    var decoded = jsonDecode(response.body);
    BTCrate = decoded['rate'];
    print(BTCrate);
    return this.BTCrate;
  }

  Future eth(
    String selectedCurrency,
  ) async {
    Response response = await get(Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/ETH/$selectedCurrency?apikey=CC2BAAE9-47E8-4A02-92E5-303E9B8221F5'));
    var decoded = jsonDecode(response.body);
    ETHrate = decoded['rate'];

    return this.ETHrate;
  }

  Future ltc(
    String selectedCurrency,
  ) async {
    Response response = await get(Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/LTC/$selectedCurrency?apikey=CC2BAAE9-47E8-4A02-92E5-303E9B8221F5'));
    var decoded = jsonDecode(response.body);
    LTCrate = decoded['rate'];

    return this.LTCrate;
  }
}
