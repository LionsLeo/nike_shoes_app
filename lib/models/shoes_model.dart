class ShoesModel {
  String name, price, image;

  ShoesModel(this.name, this.price, this.image);
}

List<ShoesModel> shoesData = shoes
    .map((item) => ShoesModel(
          item['name']!,
          item['price']!,
          item['image']!,
        ))
    .toList();

var shoes = [
  {
    "name": "Air Max 97",
    "price": "20.99",
    "image": "assets/shoes/2.png",
  },
  {
    "name": "React Presto",
    "price": "25.99",
    "image": "assets/shoes/3.png",
  },
  {
    "name": "Air Max 200 SE",
    "price": "30.99",
    "image": "assets/shoes/4.png",
  },
  {
    "name": "Air Max 300 SE",
    "price": "35.99",
    "image": "assets/shoes/5.png",
  }
];
