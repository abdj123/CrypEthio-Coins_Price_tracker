import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'CoinsCard.dart';
import 'CoinsInfo.dart';
import 'package:http/http.dart' as http;

class BoxCreator extends StatefulWidget {
  const BoxCreator({super.key});

  @override
  State<BoxCreator> createState() => _BoxCreatorState();
}

class _BoxCreatorState extends State<BoxCreator> {
  List<CoinsInfo> coinList = [];

  Future<List<CoinsInfo>> parseData() async {
    //List coinList = [];

    http.Response response = await http.get(Uri.parse(
        "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false"));

    if (response.statusCode == 200) {
      List<dynamic> responseData = json.decode(response.body);
      //List<CoinsInfo> coinList = [];
      if (responseData.isNotEmpty) {
        for (int i = 0; i < responseData.length; i++) {
          Map<String, dynamic> map = responseData[i];
          coinList.add(CoinsInfo.fromJson(map));
        }
      }
      setState(() {
        coinList;
      });
      return coinList;
    } else {
      throw Exception("Failed to fetch coins data");
    }
  }

  @override
  void initState() {
    parseData();
    Timer.periodic(Duration(seconds: 10), (timer) {
      parseData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 12),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: coinList.length,
          itemBuilder: (context, index) {
            return CoinsCard(
                name: coinList[index].name,
                symbol: coinList[index].symbol,
                image: coinList[index].image,
                price: coinList[index].current_price.toDouble(),
                priceChange: coinList[index].price_change.toDouble(),
                changePercentage:
                    coinList[index].price_change_percentage.toDouble());
          },
        ));
  }
}
