Future<String> fetchData() async{
    await Future.delayed(Duration(seconds: 3));
    return "Data Loaded";
}


void main() async{
    try{
      print("Fetching data...");
      String data = await fetchData();
      print(data);
    }
    catch(e){
      print("Error: $e");
    }
}