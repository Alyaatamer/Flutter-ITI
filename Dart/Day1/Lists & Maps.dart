void main(){
//   1. Given list = [10, 20, 30, 40]:
    // - Use for-in loop to print elements.
    // - Use forEach to print each element multiplied by 2.
    // - Use spread operator ... to merge with another list [50, 60].

    List<int> numbers = [10 , 20 , 30 , 40];
    for (var element in numbers) {
      print(element);
    }

    print('============================');
    numbers.forEach((element){
      print(element*2);
    });

    print('============================');
    List<int> list2 = [50 , 60];
    List<int> newlist = [...numbers,...list2];
    print(newlist);

    print('============================');
//     2. Create a Map:
    //    var student = { 'name': 'Ali', 'age': 22, 'grade': 'A' };
    var student = { 'name': 'Ali', 'age': 22, 'grade': 'A' };
    // - Print all values using forEach.
    student.forEach((key,value){
      print('Key : $key , Value : $value');
    });
    print('============================');
    // - Add a new key 'city: Cairo'.
    student['city']='Cairo';
    // - Update grade to 'B'.
    student['grade']='B';

    student.forEach((key,value){
      print('Key : $key , Value : $value');
    });
}