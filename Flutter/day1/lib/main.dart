import 'package:day1/SecondScreen.dart';
import 'package:flutter/material.dart';

void main(){
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    );
  }
}


class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Budget",
             style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
             ),
            ),
          backgroundColor: Color(0xFF9133FF),
          actions: [
             Icon(
                Icons.person,
                size: 30,
                color: Colors.white,
             ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 100,
                  height: 75,
                  decoration: BoxDecoration(
                    color: Color(0xFFD0D0D0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Income",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "\$1400",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  height: 75,
                  decoration: BoxDecoration(
                    color: Color(0xFFD5BAF2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Spent",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "\$2000",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  height: 75,
                  decoration: BoxDecoration(
                    color: Color(0xFFBBDCDB),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Left",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "\$1000",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                 Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    " UpComing bills",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ListTile(
                  leading: Icon(
                    Icons.electric_bolt,
                    color: Colors.amber,
                    size: 20 ,
                  ) ,
                  title: Text(
                    "Electricity",
                     style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text("Due Sep 28"),
                  trailing: Text("\$121"),
                ),
                ListTile(
                  leading: Icon(
                    Icons.wifi,
                    color: Colors.blue,
                    size: 20 ,
                  ) ,
                  title: Text(
                    "Internet" ,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text("Due Sep 28"),
                  trailing: Text("\$80"),
                ),
                ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Colors.red,
                    size: 20 ,
                  ) ,
                  title: Text(
                    "Rent",
                     style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text("Due Sep 28"),
                  trailing: Text("\$100"),
                ),
              ],
            ),
            SizedBox(height: 10),
            Align(
                alignment: Alignment.center,
                child: Text(
                  "Tip : Long-Press a bill to mark paid.",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Column(
                  children: [
                    SizedBox(height: 200),
                    ElevatedButton(
                      onPressed: (){
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => Secondscreen()),
                          );
                      }, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Color(0xFF9133FF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Go To MyProfile",
                      style: TextStyle(
                        color: Color(0xFF9133FF),
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
            ),
          ],
        ),

        bottomNavigationBar: Container(
          height: 50,
          color: Color(0xFF9133FF),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.home,
                color: Colors.white,
                size: 30,
              ),
              Icon(
                Icons.card_travel,
                color: Colors.white,
                size: 30,
              ),
              Icon(
                Icons.category,
                color: Colors.white,
                size: 30,
              ),
              Icon(
                Icons.settings,
                color: Colors.white,
                size: 30,
              ),
            ],
          ),
        ),
    );
  }
}
