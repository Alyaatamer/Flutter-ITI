
Stream<int> countStream() async* {
    for(int i = 1; i <= 5; i++){
      await Future.delayed((Duration(seconds: 1)));
      yield i;
    }
}

void main() async {
    await for (int number in countStream()) {
        print(number); 
    }
}