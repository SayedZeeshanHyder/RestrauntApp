import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mprapp/screens/auth/login.dart';
import 'package:mprapp/screens/home/premiumscreen.dart';

class Home extends StatefulWidget
{


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500),()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>PremiumScreen())));
  }

  final bottomNavItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home",backgroundColor: Colors.transparent),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined),label: "Orders",backgroundColor: Colors.transparent),
    BottomNavigationBarItem(icon: Icon(Icons.dining),label: "Home",backgroundColor: Colors.transparent),
    BottomNavigationBarItem(icon: Icon(Icons.person),label: "Me",backgroundColor: Colors.transparent),
  ];

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height*0.05,
              ),

              //Name Row
              Row(
                children: [
                  SizedBox(width: size.width*0.05,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Good Morning ,",style: TextStyle(fontSize: size.width*0.045),),
                      Text(auth.currentUser!.displayName.toString(),style:  GoogleFonts.roboto(fontWeight: FontWeight.w600,fontSize: size.width*0.09,),),
                    ],
                  ),
                  Spacer(),
                  InkWell(
                    splashFactory: NoSplash.splashFactory,
                    onTap: (){
                      auth.signOut();
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>login()));
                    },
                    child: CircleAvatar(
                      radius: size.width*0.07,
                      child: Icon(Icons.person),
                    ),
                  ),
                  SizedBox(width: size.width*0.05,),
                ],
              ),
              SizedBox(
                height: size.height*0.04,
              ),


              //Search Field Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: size.width*0.02),
                    alignment: Alignment.center,
                    width: size.width*0.8,
                    height: size.height*0.07,
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(size.width*0.05),
                    ),
                    child: TextField(
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search,color: Colors.white,),
                        hintText: "Search your cravings",
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: size.width*0.12,
                    height: size.height*0.06,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size.width*0.03),
                      color: Colors.brown
                    ),
                    child: const Icon(Icons.filter_list,color: Colors.white,),
                  ),
                ],
              ),
              SizedBox(
                height: size.height*0.04,
              ),


              //Banner Row
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(width: size.width*0.04,),
                    Container(
                      width: size.width*0.8,
                      height: size.height*0.2,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage('https://img.freepik.com/free-psd/juicy-burger-week-american-food-banner_23-2148502656.jpg?size=626&ext=jpg&ga=GA1.1.1448711260.1706486400&semt=ais'),fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(size.width*0.07),
                      ),
                    ),
                    SizedBox(width: size.width*0.04,),
                    Container(
                      width: size.width*0.8,
                      height: size.height*0.2,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage('https://img.freepik.com/free-psd/juicy-burger-week-american-food-banner_23-2148502656.jpg?size=626&ext=jpg&ga=GA1.1.1448711260.1706486400&semt=ais'),fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(size.width*0.07),
                      ),
                    ),
                    SizedBox(width: size.width*0.04,),
                    Container(
                      width: size.width*0.8,
                      height: size.height*0.2,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage('https://img.freepik.com/free-psd/juicy-burger-week-american-food-banner_23-2148502656.jpg?size=626&ext=jpg&ga=GA1.1.1448711260.1706486400&semt=ais'),fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(size.width*0.07),
                      ),
                    ),
                    SizedBox(width: size.width*0.04,),
                    Container(
                      width: size.width*0.8,
                      height: size.height*0.2,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage('https://img.freepik.com/free-psd/juicy-burger-week-american-food-banner_23-2148502656.jpg?size=626&ext=jpg&ga=GA1.1.1448711260.1706486400&semt=ais'),fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(size.width*0.07),
                      ),
                    ),
                    SizedBox(width: size.width*0.04,),
                  ],
                ),
              ),
              SizedBox(
                height: size.height*0.02,
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width*0.05),
                child: Text("Popular",style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: size.width*0.07),),
              ),
              SizedBox(height: size.height*0.01,),


              //Popular Row
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: size.width*0.05,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: size.width*0.03,vertical: size.height*0.02),
                      width: size.width*0.6,
                      height: size.height*0.4,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7rhCuQcNj7VA9JH6zINlg9g7qnyuycoxeXuEJCXlflQ&s",),fit: BoxFit.cover),
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(size.width*0.07)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Food Name",style: GoogleFonts.roboto(fontSize: size.width*0.07,fontWeight: FontWeight.w500),),
                          Text("Small Food Description that may include two lines at max",style: GoogleFonts.roboto(fontSize: size.width*0.05),maxLines: 2,overflow: TextOverflow.ellipsis,)
                        ],
                      )
                    ),

                    SizedBox(
                      width: size.width*0.05,
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: size.width*0.03,vertical: size.height*0.02),
                        width: size.width*0.6,
                        height: size.height*0.4,
                        decoration: BoxDecoration(
                            image: DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7rhCuQcNj7VA9JH6zINlg9g7qnyuycoxeXuEJCXlflQ&s",),fit: BoxFit.cover),
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(size.width*0.07)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Food Name",style: GoogleFonts.roboto(fontSize: size.width*0.07,fontWeight: FontWeight.w500),),
                            Text("Small Food Description that may include two lines at max",style: GoogleFonts.roboto(fontSize: size.width*0.05),maxLines: 2,overflow: TextOverflow.ellipsis,)
                          ],
                        )
                    ),

                    SizedBox(
                      width: size.width*0.05,
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: size.width*0.03,vertical: size.height*0.02),
                        width: size.width*0.6,
                        height: size.height*0.4,
                        decoration: BoxDecoration(
                            image: DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7rhCuQcNj7VA9JH6zINlg9g7qnyuycoxeXuEJCXlflQ&s",),fit: BoxFit.cover),
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(size.width*0.07)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Food Name",style: GoogleFonts.roboto(fontSize: size.width*0.07,fontWeight: FontWeight.w500),),
                            Text("Small Food Description that may include two lines at max",style: GoogleFonts.roboto(fontSize: size.width*0.05),maxLines: 2,overflow: TextOverflow.ellipsis,)
                          ],
                        )
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: size.height*0.03,
              ),

            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        backgroundColor: Colors.brown,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(fontSize: size.width*0.04,fontWeight: FontWeight.bold),
        items: bottomNavItems,
        currentIndex: 0,
      ),
    );
  }
}