import 'dart:io';
import 'dart:math';

void main(){

//1. Create a Dart program that takes two numbers (num1 and num2)
    print("Enter the First Number : ");
    int num1 = int.parse(stdin.readLineSync()!);
    print("Enter the Second Number : ");
    int num2 = int.parse(stdin.readLineSync()!);

    //- Print their sum, product, and difference.
    int sum = num1 + num2 ;
    int product = num1 * num2;
    int difference = max(num1,num2) - min(num1,num2);
    print('sum : $sum\nproduct : $product\ndifference : $difference');
    print('============================');

    //- Use relational operators (>, <, ==) to print which one is greater.
    if(num1>num2){
      print('num1 > num2');
    }
    else if(num2>num1){
      print('num2 > num1');
    }
    else {
      print('num1 == num2');
    }
    print('============================');
    
//2. Use logical operators (&&, ||, !) to check:
    // - Print 'Both are positive' if both are positive.
    if(num1 > 0 && num2 > 0){
      print('Both are positive');
    }
    // - Print 'At least one is positive' if at least one is positive.
    if(num1 > 0 || num2 > 0){
      print('At least one is positive');
    }
    print('============================');

// 3. Try null-aware operators:
    // - Declare String? name = null.
    String? name = null;
    // - Print the name or 'Unknown' using ?? operator.
    print(name?? "UnKnown");
    // - Print name?.length.
    print(name?.length);


}