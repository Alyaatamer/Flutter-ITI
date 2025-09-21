// Create a class Calculator with a method add() that works:
    // • With two parameters → sum of two numbers.
    // • With three parameters → sum of three numbers.
    // (Hint: use optional parameters)

class Calculator{
  int adds(int num1,int num2 , [int? num3]){
    if(num3!=null) return num1+num2+num3;
    else return num1+num2;
  }

}


void main(){
  Calculator c1 = Calculator();
  print(c1.adds(1, 2));
  print(c1.adds(1, 2, 3));
}