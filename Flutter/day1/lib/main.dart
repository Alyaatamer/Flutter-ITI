import 'package:flutter/material.dart';

void main(){
    runApp(MyApp());
}


class MyApp extends StatelessWidget{
    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
            SizedBox(height: 20),
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
                    "UpComing bills",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ListTile(
                  leading: Icon(Icons.electric_bolt) ,
                  title: Text("Electricity"),
                  subtitle: Text("Due Sep 28"),
                  trailing: Text("\$121"),
                ),
                ListTile(
                  leading: Icon(Icons.wifi) ,
                  title: Text("Internet"),
                  subtitle: Text("Due Sep 28"),
                  trailing: Text("\$80"),
                ),
                ListTile(
                  leading: Icon(Icons.home) ,
                  title: Text("Rent"),
                  subtitle: Text("Due Sep 28"),
                  trailing: Text("\$100"),
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
                Icons.settings,
                color: Colors.white,
                size: 30,
              ),
              Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}