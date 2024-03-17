import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyOrders extends StatelessWidget
{

  final CarouselController cc = CarouselController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(physics: const BouncingScrollPhysics(),itemCount: 3,itemBuilder: (context,index){
      return tableCard(size, context);
    });
  }

  Widget tableCard(Size size,BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: size.height*0.02,
        ),
        CarouselSlider(
          carouselController: cc,
          options: CarouselOptions(height: size.height*0.3,reverse: true,enableInfiniteScroll: true),
          items: [1,2,3,4,5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: size.width*0.02),
                  width: size.width*0.9,
                  height: size.height*0.24,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(size.width*0.03),
                  ),
                  child: Text(i.toString()),
                );
              },
            );
          }).toList(),
        ),
        SizedBox(
          height: size.height*0.02,
        ),
        Row(
          children: [
            SizedBox(width: size.width*0.06,),
            Text("Table 2",style: GoogleFonts.roboto(fontSize: size.width*0.06,fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
            Spacer(),
            Text("2 Seats",style: GoogleFonts.roboto(fontSize: size.width*0.06,fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
            SizedBox(width: size.width*0.06,),
          ],
        ),
        SizedBox(
          height: size.height*0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              alignment: Alignment.center,
              width: size.width*0.45,
              height: size.height*0.06,
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(size.width*0.03),
              ),
              child: Text("Save for later",style: GoogleFonts.roboto(color: Colors.white,fontSize: size.width*0.05,fontWeight: FontWeight.bold),),
            ),
            Container(
              alignment: Alignment.center,
              width: size.width*0.45,
              height: size.height*0.06,
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(size.width*0.03),
              ),
              child: Text("Book Table",style: GoogleFonts.roboto(color: Colors.white,fontSize: size.width*0.05,fontWeight: FontWeight.bold),),
            ),
          ],
        ),
        SizedBox(
          height: size.height*0.01,
        ),
        Divider(
          thickness: size.height*0.005,
          color: Colors.brown,
        ),
      ],
    );
  }
}

/*
Container(
margin: EdgeInsets.symmetric(
horizontal: size.width*0.07
),
alignment: Alignment.center,
decoration: BoxDecoration(
color: Colors.brown,
borderRadius: BorderRadius.circular(size.width*0.05)
),
padding: EdgeInsets.symmetric(
horizontal: size.width*0.07,
),
child: TextField(
onTap: ()async{
final date = await showDatePicker(context: context,firstDate: DateTime(2024), lastDate: DateTime(2050),);
if(date!=null){
print(date);
}
},
cursorColor: Colors.white,
decoration: InputDecoration(
border: InputBorder.none,
labelStyle: GoogleFonts.roboto(color: Colors.white),
labelText: "Select Date",
suffixIcon: Icon(Icons.calendar_today,color: Colors.white,),
),
),
),*/
