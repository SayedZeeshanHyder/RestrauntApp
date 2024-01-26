import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05, vertical: size.width * 0.03),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome",
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w600,
                              fontSize: size.width * 0.07),
                        ),
                        Text(
                          "Zeeshan",
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w600,
                              fontSize: size.width * 0.09),
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.notifications),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(size.width * 0.03),
                ),
                width: size.width * 0.9,
                height: size.height * 0.07,
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search...",
                    hintStyle: GoogleFonts.roboto(color: Colors.grey.shade500),
                    suffixIcon: Icon(Icons.search),
                    suffixIconColor: Colors.grey.shade500,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),


              //Chips
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Container(
                      width: size.width * 0.3,
                      height: size.height * 0.07,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: size.width * 0.005, color: Colors.orange),
                        borderRadius: BorderRadius.circular(size.width * 0.07),
                        color: Colors.grey.shade100,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.fastfood),
                          Text("Food"),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    Container(
                      width: size.width * 0.3,
                      height: size.height * 0.07,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: size.width * 0.002, color: Colors.orange),
                        borderRadius: BorderRadius.circular(size.width * 0.07),
                        color: Colors.grey.shade100,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.fastfood),
                          Text("Food"),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    Container(
                      width: size.width * 0.3,
                      height: size.height * 0.07,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: size.width * 0.002, color: Colors.orange),
                        borderRadius: BorderRadius.circular(size.width * 0.07),
                        color: Colors.grey.shade100,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.fastfood),
                          Text("Food"),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    Container(
                      width: size.width * 0.3,
                      height: size.height * 0.07,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: size.width * 0.002, color: Colors.orange),
                        borderRadius: BorderRadius.circular(size.width * 0.07),
                        color: Colors.grey.shade100,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.fastfood),
                          Text("Food"),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),


              //Popular Row
              Row(
                children: [
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                  Text(
                    "Popular",
                    style: GoogleFonts.roboto(
                        fontSize: size.width * 0.07,
                        fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  Text(
                    "View All",
                    style: GoogleFonts.roboto(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: size.width * 0.01,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: size.width * 0.04,
                  ),
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                ],
              ),


              SizedBox(
                height: size.height * 0.03,
              ),


              // Popular Cards
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius:
                                  BorderRadius.circular(size.width * 0.04),),
                          width: size.width * 0.45,
                          height: size.height * 0.2,
                        ),
                        SizedBox(height: size.height*0.02,),
                        SizedBox(
                          width: size.width*0.3,
                          child: Text("Biryani Rice abcdefffffff",style: GoogleFonts.roboto(fontSize: size.width*0.05,fontWeight: FontWeight.w500),maxLines: 2,overflow: TextOverflow.ellipsis,),)
                      ],
                    ),
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius:
                                  BorderRadius.circular(size.width * 0.04)),
                          width: size.width * 0.45,
                          height: size.height * 0.2,
                        ),
                        SizedBox(height: size.height*0.02,),
                        Text("Biryani Rice")
                      ],
                    ),
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius:
                              BorderRadius.circular(size.width * 0.04)),
                          width: size.width * 0.45,
                          height: size.height * 0.2,
                        ),
                        SizedBox(height: size.height*0.02,),
                        Text("Biryani Rice")
                      ],
                    ),
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius:
                              BorderRadius.circular(size.width * 0.04)),
                          width: size.width * 0.45,
                          height: size.height * 0.2,
                        ),
                        SizedBox(height: size.height*0.02,),
                        Text("Biryani Rice")
                      ],
                    ),
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius:
                              BorderRadius.circular(size.width * 0.04)),
                          width: size.width * 0.45,
                          height: size.height * 0.2,
                        ),
                        SizedBox(height: size.height*0.02,),
                        Text("Biryani Rice")
                      ],
                    ),
                    SizedBox(
                      width: size.width * 0.03,
                    ),

                  ],
                ),
              ),

              SizedBox(
                height: size.height * 0.03,
              ),


              //Offers of the day Row
              Row(
                children: [
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                  Text(
                    "Offers of the day",
                    style: GoogleFonts.roboto(
                        fontSize: size.width * 0.07,
                        fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  Text(
                    "View All",
                    style: GoogleFonts.roboto(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: size.width * 0.01,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: size.width * 0.04,
                  ),
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                ],
              ),


              SizedBox(
                height: size.height * 0.03,
              ),


              //Offers Card
              Container(
                width: size.width*0.9,
                height: size.height*0.25,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(size.width*0.06)
                ),
              ),

              SizedBox(
                height: size.height*0.05,
              ),
            ],
          ),
        ),

        bottomNavigationBar: BottomNavigationBar(
          onTap: (index){
            setState(() {
              currentIndex = index;
            });
          },
          currentIndex: currentIndex,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.grey.shade700,
          items: const [
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.home),label: "Home"),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.heart),label: "Favourites"),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.person),label: "Mes"),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.cart),label: "Cart"),
          ],
        ),
      ),
    );
  }
}
