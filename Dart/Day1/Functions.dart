import 'dart:io';

// 1. Create a function addNumbers that takes 2 numbers and prints their sum.
int addNumbers(int x ,int y){
  return x+y;
}

// 2. Create a function using arrow syntax that returns the square of a number.
int square(int x) => x*x;

// 3. Create a function greet with optional parameters name and city:
// - If name is null, print 'Hello Guest'.
// - If name exists but no city, print 'Hello Ali'.
// - If both exist, print 'Hello Ali from Cairo'.
void greet({String? name , String? city}){
    if(name == null){
      print('Hello Guest');
    }
    else if(name != null && city == null){
      print('Hello $name');
    }
    else {
       print('Hello $name from $city');
    }
}

void main(){
  print(addNumbers(2,3));
  print('============================');

  print(square(5));
  print('============================');

  greet(name: 'Alyaa',city: 'cairo');

}

