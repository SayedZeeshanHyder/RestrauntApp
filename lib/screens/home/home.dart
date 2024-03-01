import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../auth/login.dart';

class Home extends StatelessWidget {
  final searchController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.05,
          ),

          //Name Row
          Row(
            children: [
              SizedBox(
                width: size.width * 0.05,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Good Morning,",
                    style: TextStyle(fontSize: size.width * 0.06,),
                  ),
                  Text(
                    auth.currentUser!.displayName.toString(),
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w600,
                      fontSize: size.width * 0.09,
                    ),
                  ),
                ],
              ),
              Spacer(),
              CircleAvatar(
                radius: size.width*0.08,
                backgroundColor: Colors.grey.shade100,
                child: auth.currentUser?.photoURL != null ? Image.network(auth.currentUser!.photoURL.toString()) : Icon(Icons.photo),
              ),
              SizedBox(
                width: size.width * 0.05,
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.04,
          ),

          //Search Field Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                alignment: Alignment.center,
                width: size.width * 0.8,
                height: size.height * 0.07,
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(size.width * 0.05),
                ),
                child: TextField(
                  controller: searchController,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
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
                width: size.width * 0.12,
                height: size.height * 0.06,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(size.width * 0.03),
                    color: Colors.brown),
                child: const Icon(
                  Icons.filter_list,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.02,
          ),


          //Daily Special
          Padding(
            padding: EdgeInsets.only(left: size.width * 0.05),
            child: Text(
              "Today's Special",
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold, fontSize: size.width * 0.07),
            ),
          ),
          SizedBox(
            height: size.height*0.015,
          ),
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("Menu")
                  .doc('special')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                    width: size.width,
                    height: size.height * 0.3,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.brown.shade900,
                      ),
                    ),
                  );
                }

                final imgUrl = snapshot.data!.data()!['imgUrl'];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: size.width*0.03,),
                  width: size.width,
                  height: size.height * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(size.width*0.09),
                    image: DecorationImage(image: NetworkImage(imgUrl),fit: BoxFit.cover),
                  ),
                );
              }),

          SizedBox(
            height: size.height * 0.02,
          ),
          ListTile(
            title: Text("Popular",style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold, fontSize: size.width * 0.07),),
            trailing: InkWell(
              onTap: (){},
              child: Icon(CupertinoIcons.right_chevron,color: Colors.black,size: size.width*0.07,),
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),

          //Popular Row
          Padding(
            padding: EdgeInsets.only(left: size.width * 0.04),
            child: SizedBox(
              height: size.height * 0.4,
              width: size.width,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("Menu")
                      .doc("Menu")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    List items = snapshot.data!.data()!["items"];
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return foodCard(size, items[index]);
                        });
                  }),
            ),
          ),

          SizedBox(
            height: size.height * 0.03,
          ),


          //Veg
          ListTile(
            title: Text("Veg",style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold, fontSize: size.width * 0.07),),
            trailing: InkWell(
              onTap: (){},
              child: Icon(CupertinoIcons.right_chevron,color: Colors.black,size: size.width*0.07,),
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Padding(
            padding: EdgeInsets.only(left: size.width * 0.04),
            child: SizedBox(
              height: size.height * 0.4,
              width: size.width,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("Menu")
                      .doc("Menu")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    List items = snapshot.data!.data()!["items"];
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          if(items[index]['isVeg']) {
                            return foodCard(size, items[index]);
                          }
                          return SizedBox();
                        });
                  }),
            ),
          ),

          SizedBox(
            height: size.height * 0.03,
          ),





          //NonVeg
          ListTile(
            title: Text("NonVeg",style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold, fontSize: size.width * 0.07),),
            trailing: InkWell(
              onTap: (){},
              child: Icon(CupertinoIcons.right_chevron,color: Colors.black,size: size.width*0.07,),
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Padding(
            padding: EdgeInsets.only(left: size.width * 0.04),
            child: SizedBox(
              height: size.height * 0.4,
              width: size.width,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("Menu")
                      .doc("Menu")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    List items = snapshot.data!.data()!["items"];
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          if(!items[index]['isVeg']) {
                            return foodCard(size, items[index]);
                          }
                          return const SizedBox();
                        });
                  }),
            ),
          ),

          SizedBox(
            height: size.height * 0.03,
          ),




          //Starters
          ListTile(
            title: Text("Starters",style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold, fontSize: size.width * 0.07),),
            trailing: InkWell(
              onTap: (){},
              child: Icon(CupertinoIcons.right_chevron,color: Colors.black,size: size.width*0.07,),
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Padding(
            padding: EdgeInsets.only(left: size.width * 0.04),
            child: SizedBox(
              height: size.height * 0.4,
              width: size.width,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("Menu")
                      .doc("Menu")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    List items = snapshot.data!.data()!["items"];
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          if(items[index]['category']=='Breakfast') {
                            return foodCard(size, items[index]);
                          }
                          return const SizedBox();
                        });
                  }),
            ),
          ),

          SizedBox(
            height: size.height * 0.03,
          ),




          //Starters
          ListTile(
            title: Text("Main Course",style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold, fontSize: size.width * 0.07),),
            trailing: InkWell(
              onTap: (){},
              child: Icon(CupertinoIcons.right_chevron,color: Colors.black,size: size.width*0.07,),
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Padding(
            padding: EdgeInsets.only(left: size.width * 0.04),
            child: SizedBox(
              height: size.height * 0.4,
              width: size.width,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("Menu")
                      .doc("Menu")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    List items = snapshot.data!.data()!["items"];
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          if(items[index]['category']=='Main Course') {
                            return foodCard(size, items[index]);
                          }
                          return const SizedBox();
                        });
                  }),
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),




          //Deserts
          ListTile(
            title: Text("Deserts",style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold, fontSize: size.width * 0.07),),
            trailing: InkWell(
              onTap: (){},
              child: Icon(CupertinoIcons.right_chevron,color: Colors.black,size: size.width*0.07,),
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Padding(
            padding: EdgeInsets.only(left: size.width * 0.04),
            child: SizedBox(
              height: size.height * 0.4,
              width: size.width,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("Menu")
                      .doc("Menu")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    List items = snapshot.data!.data()!["items"];
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          if(items[index]['category']=='Desserts') {
                            return foodCard(size, items[index]);
                          }
                          return const SizedBox();
                        });
                  }),
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
        ],
      ),
    );
  }

  Widget foodCard(Size size, item) {
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.02),
        width: size.width * 0.6,
        margin: EdgeInsets.only(right: size.width * 0.05),
        decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(item["imgUrl"],),fit: BoxFit.cover),
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(size.width * 0.07)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              item["name"],
              style: GoogleFonts.roboto(
                  fontSize: size.width * 0.07, fontWeight: FontWeight.w500,color: Colors.white),
            ),
            Text(
              item["description"],
              style: GoogleFonts.roboto(fontSize: size.width * 0.05,color: Colors.white),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text("Ratings : ${item["ratings"].toString()}",style: GoogleFonts.roboto(color: Colors.white),),
          ],
        ));
  }
}
