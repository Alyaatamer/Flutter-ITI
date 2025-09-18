void main(){

    Map<String,int> students = {
      "Alyaa" : 90,
      "Soher" : 95
    };

    for (var element in students.keys) {
      print(element);
    }

    print('==============================');

    var mx = students.values.reduce((a,b) => a > b ? a : b);
    print(mx);

    print('==============================');

    students.remove("Soher");
    for (var element in students.keys) {
          print(element);
    }


}