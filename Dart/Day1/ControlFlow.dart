import 'dart:io';

void main(){
// 1. Create a program that reads a grade (0 to 100) and prints:
    // - 'A' if between 90 and 100
    // - 'B' if between 80 and 89
    // - 'C' if between 70 and 79
    // - 'F' if less than 70

  print("Enter the Total Marks : ");
  int marks = int.parse(stdin.readLineSync()!);

  if (marks >= 90 && marks <= 100) print('A');
  else if (marks >= 80 && marks <= 89) print("B");
  else if (marks >= 70 && marks <= 79) print("C");
  else print("F");
  print('============================');
  
//2. Create a loop from 1 to 10 and print only even numbers.
  for(int i = 1 ; i<= 10 ;i++){
    if(i%2 == 0){
      print(i);
    }
  }
  print('============================');
//3. Create a program that takes a number (1 to 7) and prints the weekday name using switch case

  print('Enter the day : ');
  int day = int.parse(stdin.readLineSync()!);
  
  switch(day){
    case 1:
    print("Saturday");
    break;
    case 2:
    print("Sunday");
    break;
    case 3:
    print("Monday");
    break;
    case 4:
    print("Tuesday");
    break;
    case 5:
    print("Wednesday");
    break;
    case 6:
    print("Thursday");
    break;
    case 7:
    print("Friday");
    break;
    default:
      print("Invalid");
  }

}
