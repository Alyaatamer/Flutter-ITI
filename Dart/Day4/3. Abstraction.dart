// Create an abstract class Shape with a method area().
    // • Implement two subclasses Circle and Rectangle.
    // • Calculate and return the area in each class.
    // • In main(), create objects and print their areas.


abstract class Shape{
   void calcArea();
}

class Circle extends Shape{
    double radius ;
    Circle(this.radius);

    void calcArea(){
      double area = radius * radius * 3.14;
      print("Area of circle is $area");
    }
}

class Rectangle extends Shape{

    double height;
    double width;

    Rectangle(this.height,this.width);

    void calcArea() {
      double area = height * width;
      print("Area of rectangle is $area");
    }
}

void main(){

    Circle c1 = Circle(1.4);
    c1.calcArea();

    Rectangle r1 = Rectangle(1, 2);
    r1.calcArea();
}