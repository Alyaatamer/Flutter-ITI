// Create a simple E-Commerce program.
// 1. Class Product
// a. Private variables: _id, _name, _price
// b. Getter/Setter with validation (price > 0)

// 2. Class Cart
// a. List of products
// b. Methods: addProduct(), removeProduct(), showCart()

// 3. In main()
// a. Create 3 products
// b. Add 2 to the cart
// c. Print cart contents and total price

class product{
   int _id = 0;
   String _name = "";
   int _price = 0;

   int get id => _id;
   String get name => _name;
   int get price => _price;

    product(this._id, this._name, int price) {
         this.price = price; 
    }

    set id(int id) {
      _id = id;
    }

    set name(String name) {
      _name = name;
   }

   set price(int price) {
      if(price > 0){
        _price = price;
      }
   }


}


class Cart{
    List<product> products = [];

    void addProduct(product p){
      products.add(p);
    }

    void removeProduct(product p){
      products.remove(p);
    }

    void showCart(){
      int total = 0;
      for (var element in products) {
        print("ID: ${element.id}, Name: ${element.name}, Price: ${element._price}");
        total += element._price;
      }
      print("Total: $total");
    }
}

void main(){
    product p1 = product(1, "milk", 500);
    product p2 = product(2, "water", 300);
    product p3 = product(3, "v cola", 200);

    Cart cart = Cart();
    cart.addProduct(p1);
    cart.addProduct(p2);
    cart.addProduct(p3);

    cart.showCart();
}
