import 'package:flutter/material.dart';

class Friends extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: size.width*0.45,
            height: size.height*0.07,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                foregroundColor: Colors.white
              ),
              onPressed: (){},
              child: Text("Join Room"),
            ),
          ),
          SizedBox(
            width: size.width*0.45,
            height: size.height*0.07,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  foregroundColor: Colors.white
              ),
              onPressed: (){},
              child: Text("Create Room"),
            ),
          ),
        ],
      ),
    );
  }

}