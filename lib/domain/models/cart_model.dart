


 class CartProductModel {
  String  ? name, image, price, productId,color,size;
  int  ? quantity;


  CartProductModel(
      {this.name, this.image, this.quantity, this.price,
        this.productId,this.color,this.size});

  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    quantity = map['quantity'];
    color=map['color'];
    size=map['size'];
    print("s=$size");
    print("c=$color");



    price=map['price'];
    productId = map['productid'];

    //  brand_email=map['brandemail'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'quantity': quantity,
      'price': price,
      'productid': productId,
      'color':color,
      'size':size
      //'brand':brand,
      //  'brandemail':brand_email
    };
  }
}
