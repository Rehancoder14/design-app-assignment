class CatelogModel {
  static List<Items> items = [
    Items(
        id: "111",
        name: "Chess Clock",
        description: "DgT 300 Digital Chess Clock - FIDE Approved",
        price: 7000,
        color: "#33505a",
        image: "assets/clock.png",
        fulldescription:
            "DGT 3000 Abstract Digital Chess Clock (Multicolour, 130 x 30 mm) for 4 years and up")
  ];
}

class Items {
  final String id;
  final String name;
  final String description;
  final int price;
  final String fulldescription;
  final String color;
  final String image;
  Items(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.color,
      required this.image,
      required this.fulldescription});

  factory Items.fromMap(Map<String, dynamic> map) {
    return Items(
        id: map["id"],
        name: map["name"],
        description: map["description"],
        price: map["price"],
        color: map["color"],
        image: map['image'],
        fulldescription: map['fulldescription']);
  }
  toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "color": color,
        "image": image,
        "fulldescription": fulldescription
      };
}
