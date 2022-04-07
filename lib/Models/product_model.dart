class Product {
  String title;
  String image;
  double price;
  String description;
  bool favorite;

  Product(this.title, this.image, this.price, this.description, this.favorite);
}

late List<Product> productList = [
  Product(
      'Áo sơ mi',
      'https://4men.com.vn/thumbs/2016/07/ao-so-mi-han-quoc-cam-tron-asm788-4007-p.jpg',
      19.99,
      'Áo sơ mi siêu đẹp',
      false),
  Product(
      'Áo Hoodie',
      'http://thoitrangskinny.com/upload/O1CN01qcaSdV1TY2RMSvIut_!!2016302393-0-cib_-19-03-2021-17-45-38.jpg',
      24.99,
      'Áo hoodie mới nhất',
      false),
  Product(
      'Áo thun',
      'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/434247/item/goods_00_434247.jpg?width=1600&impolicy=quality_75',
      14.99,
      'Áo thun chất lượng',
      false),
];
