class Cards {
   String name;
   String url;

  Cards({this.name, this.url});



  factory Cards.fromJson(Map<String, dynamic> json) {
    return Cards(
      name: json['name'],
      url: json['url'],
    );
  }
}
