import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'CoinsInfo.dart';

class CoinsCard extends StatefulWidget {
  CoinsCard({
    required this.name,
    required this.symbol,
    required this.image,
    required this.price,
    required this.priceChange,
    required this.changePercentage,
  });

  String name;
  String symbol;
  String image;
  double price;
  double priceChange;
  double changePercentage;

  @override
  State<CoinsCard> createState() => _CoinsCardState();
}

class _CoinsCardState extends State<CoinsCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[300],
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  offset: Offset(4, 4),
                  blurRadius: 10,
                  spreadRadius: 1),
              BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4, -4),
                  blurRadius: 10,
                  spreadRadius: 1),
            ]),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //NetworkImage("url"),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[300],
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(4, 4),
                            blurRadius: 10,
                            spreadRadius: 1),
                        BoxShadow(
                            color: Colors.white,
                            offset: Offset(-4, -4),
                            blurRadius: 10,
                            spreadRadius: 1),
                      ]),
                  height: 75,
                  width: 75,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.network(
                        //https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579
                        widget.image),
                  ),
                ),
              ),

              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          widget.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 28),
                        ),
                      ),
                      Text(widget.symbol)
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      widget.price.toString(),
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[900],
                          fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Text(
                          widget.priceChange.toDouble() < 0
                              ? "+" + widget.priceChange.toString().substring(1)
                              : "-" +
                                  widget.priceChange.toString().substring(1),
                          style: TextStyle(
                            fontSize: 14,
                            color: widget.priceChange < 0
                                ? Colors.green
                                : Colors.red,
                          )),
                    ),
                    Expanded(
                      child: Text(
                          widget.changePercentage.toDouble() < 0
                              ? "+" +
                                  widget.changePercentage
                                      .toString()
                                      .substring(1) +
                                  "%"
                              : "-" +
                                  widget.changePercentage
                                      .toString()
                                      .substring(1) +
                                  "%",
                          style: TextStyle(
                            fontSize: 14,
                            color: widget.changePercentage < 0
                                ? Colors.green
                                : Colors.red,
                          )),
                    ),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
