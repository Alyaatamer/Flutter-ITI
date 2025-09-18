//normal function
int area1(int length,int width){
  return length*width;
}

//arrow function
int area2(int length,int width) => length*width;

//higher-order function
void area4(int length, int width, Function operation) {
  print(operation(length, width));
}

void main(){

  //anonymous function
    var area3 = (int length,int width){
      return length*width;
    };


     print(area1(3,4));
     print('==============================');  

     print(area2(3,4));
     print('==============================');

     print(area3(3,4));
     print('==============================');

     area4(3, 4, area1);

}