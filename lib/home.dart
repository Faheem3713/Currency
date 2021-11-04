// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:currency/others.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  dynamic selectedCurrency = 'INR';

  DropdownButton<String> dropDown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          coin.BTCrate;
          coin.ETHrate;
          coin.LTCrate;
          // getData();
        });
      },
    );
  }

  CoinData coin = CoinData();

  @override
  void initState() {
    coin.btc(selectedCurrency);
    coin.eth(selectedCurrency);
    coin.ltc(selectedCurrency);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 120),
                child: Text(
                  '1 BTC = ${coin.BTCrate.roundToDouble()} $selectedCurrency',
                  style: TextStyle(color: Colors.white),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue[400],
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 120),
                child: Text(
                  '1 ETH = ${coin.ETHrate.roundToDouble()} $selectedCurrency',
                  style: TextStyle(color: Colors.white),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue[400],
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 120),
                child: Text(
                  '1 LTC =${coin.LTCrate.roundToDouble()} $selectedCurrency',
                  style: TextStyle(color: Colors.white),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue[400],
                ),
              ),
            ],
          ),
          Container(
            child: Center(child: dropDown()),
            height: 100,
            width: double.infinity,
            color: Colors.blue[400],
          )
        ],
      ),
    );
  }
}
