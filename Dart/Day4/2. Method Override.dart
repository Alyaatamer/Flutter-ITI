// Make a class Animal with a method speak().
    // • Create two classes Dog and Cat that override speak() to print different sounds.
    // • In main(), create a list of Animal objects (some Dogs, some Cats) and loop to call
    // speak() on each.

class Animal{
    void speak(){
       print("Animal is speak");
    }
}

class Dog extends Animal{
    @override
    void speak(){
       print("Dog is speak");
    }
}

class Cat extends Animal{
    @override
      void speak(){
        print("Cat is speak");
      }
}


void main(){
 
    List<Animal> Animals = [
      Dog(),
      Cat()
    ];

    for (var element in Animals) {
        element.speak();
    }

}