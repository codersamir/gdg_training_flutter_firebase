import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gdg_fire/widgets/currency_tile.dart';

class ApiPage extends StatefulWidget {
  @override
  _ApiPageState createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  bool isLoading = true;
  List<CurrencyTile> currencyTiles = [];

  void getHttp() async {
    try {
      Response response =
          await Dio().get("https://api.exchangeratesapi.io/latest?base=USD");
      Map rates = response.data["rates"];
      rates.forEach((key, value) {
        currencyTiles.add(CurrencyTile(key, value));
      });
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    getHttp();
    return Scaffold(
      appBar: AppBar(
        title: Text("Currencies status"),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: currencyTiles,
            ),
    );
  }
}
