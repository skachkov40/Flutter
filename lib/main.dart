import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_ej/cards.dart';

void main() => runApp(new MyApp()); //(cards: fetchCards()));

//List<Cards> parseCards(String responseBody) {
  //final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  //return parsed.map<Cards>((json) => Cards.fromMap(json)).toList();
//}
//<List<Cards>> fetchCards() async {
  //final response = await http.get('http://');
  //if (response.statusCode == 200) {
    //return parseCards(response.body);
  //} else {
    //throw Exception('Нет связи с REST API');
 // }
//}


class MyApp extends StatelessWidget {

  List<Cards> cards = [
    Cards(name: "Тестовое Имя", url: "https://avatars.mds.yandex.net/get-zen_doc/147743/pub_5d9cf43bb5e99265f3109510_5d9d09991d656a00ad1ffad9/scale_1200", text: "Како-то тестовый текст"),
    Cards(name: "Второе Тестовое", url: "https://nikatv.ru/public/upload/news/29265/images/3982.jpg", text: "Второе что-то ....."),
    Cards(name: "Третье название", url: "https://avatars.mds.yandex.net/get-zen_doc/1706643/pub_5e006d3843fdc000adb4b650_5e006d9443fdc000adb4b656/scale_1200", text: "Третья надпись")
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      home: Scaffold(
        body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: cards.length,
          itemBuilder: (_, index) => Container(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text("  ${cards[index].name}",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),),
                height: 260.0,
                width: 100.0,
                decoration: BoxDecoration(
                image: DecorationImage(
                        image: new NetworkImage('${cards[index].url}'),
                fit: BoxFit.fitWidth),
                ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.all_inbox),
                title: Text('I')),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box_outlined),
                title: Text('my')),

          ],
    onTap: (int index) {
    }
        ) ,
    ),

    );
  }
}