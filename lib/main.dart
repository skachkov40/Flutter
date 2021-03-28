import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_ej/cards.dart';
import 'package:http/http.dart';

void main() => runApp(MaterialApp(home: Scaffold(body: JsonListView())));

class JsonListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Blocs();
}

class Blocs extends State<JsonListView> {

  final String uri = 'https://run.mocky.io/v3/cfc636bd-c9a2-44bd-83dd-cf5c5495e820';

  Future<List<Cards>> fetchCards() async {
    final response = await get((Uri.parse(uri)),);
    if (response.statusCode == 200) {
      final items = json.decode(response.body).cast<Map<String, dynamic>>();
      List<Cards> cards = items.map<Cards>((json) {
        return Cards.fromJson(json);
      }).toList();
      return cards;
    } else {
      throw Exception('Не загрузились данные.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder <List <Cards>>(
        future: fetchCards(),
        builder: (context, init) {
            if (init.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());

          return ListView.builder(
            itemCount: init.data.length,
            itemBuilder: (context, index) {
              return Container(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text("  ${init.data[index].name}",
                    style: TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),),),
                height: 260.0,
                width: 100.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: new NetworkImage('${init.data[index].url}'),
                      fit: BoxFit.fitWidth),
                ),
              );
            },
          );
        });
  }
}