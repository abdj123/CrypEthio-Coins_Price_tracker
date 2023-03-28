import 'dart:ffi';

import 'package:flutter/material.dart';

class CoinsInfo {
  //String id;
  late String symbol;
  late String name;
  late String image;
  late num current_price;
  late num price_change;
  late num price_change_percentage;

  CoinsInfo(
      {required this.symbol,
      required this.name,
      required this.image,
      required this.current_price,
      required this.price_change,
      required this.price_change_percentage});

  factory CoinsInfo.fromJson(Map<String, dynamic> json) {
    return CoinsInfo(
        symbol: json["symbol"],
        name: json["name"],
        image: json["image"],
        current_price: json["current_price"],
        price_change: json["price_change_24h"],
        price_change_percentage: json["price_change_percentage_24h"]);
  }
}

List<CoinsInfo> coinList = [];
