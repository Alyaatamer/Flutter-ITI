// Create a base class Vehicle with properties brand and year.
    // • Add a method displayInfo() that prints the brand and year.
    // • Create two child classes Car and Bike that inherit from Vehicle.
    // • Add unique properties to each (e.g., doors for Car, type for Bike).
    // • Override displayInfo() in both classes.

class Vehicle{
  String Brand ;
  int Year ;

  Vehicle(this.Brand,this.Year);

  void displayInfo(){
    print("Brand : $Brand ,  Year : $Year");
  }

}

class Car extends Vehicle{
  int NoOfDoors;

  Car(this.NoOfDoors , String Brand ,int Year) :super(Brand,Year) ;

  @override
  void displayInfo(){
    super.displayInfo();
    print("NoOfDoors : $NoOfDoors");
  }
   

}

class Bike extends Vehicle{
    String type;

    Bike(this.type , String Brand ,int Year) :super(Brand,Year); 

    @override
    void displayInfo(){
     super.displayInfo();
     print("Type : $type");
   }
}


void main(){

    Car c1 = Car(4,"BYD",2025);
    c1.displayInfo();

    Bike b1 = Bike("Mountain bike", "Tw", 2025);
    b1.displayInfo();


}