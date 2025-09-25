

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Secondscreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
             title: Padding(
               padding: EdgeInsets.only(left: 10),
               child: Text(
                "MyProfile",
                style: TextStyle(
                color: Color(0xFF9133FF),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
           ),
        ),
    ),
          
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 10),
               Image.asset(
                  "assets/images/download.jpg",
                  width: 200,
                  height: 150,
               ),
            ],
          ),
    );

  }

}