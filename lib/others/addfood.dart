import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddFood extends StatelessWidget {

  final foodItems = [
    {
      "id": 0001,
      "name": "Murgh Makhani",
      "category": "Main Course",
      "isVeg": false,
      "price": 1250,
      "imgUrl":
          "https://drive.google.com/file/d/16c9vEyJr0UBoHXWAogNG32SMZzIwslY6/view?usp=drive_link",
      "imgUrl2":
          "https://drive.google.com/file/d/1DEjhvvfxcyun_Uz8LutBF0XLSYLELzJu/view?usp=drive_link",
      "ratings": 4.5,
      "description":
          "Classic Indian dish featuring tender chicken marinated in spices and cooked in a rich, creamy tomato and butter sauce.",
      "people": 4,
      "quantity": 2,
      "saladIncluded": [],
      "reviews": []
    },
    {
      "id": 0002,
      "name": "Chicken Tikka Masala",
      "category": "Main Course",
      "isVeg": false,
      "price": 1500,
      "imgUrl":
          "https://drive.google.com/file/d/1C4dPjhvXJ-R6uCCqXei5hspv5lX9ObZt/view?usp=drive_link",
      "imgUrl2":
          "https://drive.google.com/file/d/1arhQHCOY8N8x7pLJDmTJRLghY6omzJRx/view?usp=drive_link",
      "ratings": 4.7,
      "description":
          "Flavorful Indian dish featuring tender chunks of grilled chicken in a creamy tomato-based sauce infused with aromatic spices.",
      "people": 4,
      "quantity": 2,
      "saladIncluded": [],
      "reviews": []
    },
    {
      "id": 0003,
      "name": "Paneer Tikka Masala",
      "category": "Main Course",
      "isVeg": true,
      "price": 1250,
      "imgUrl":
          "https://drive.google.com/file/d/1npXf4lhSsrez85XByMnDLsrf4evVutxT/view?usp=drive_link",
      "imgUrl2":
          "https://drive.google.com/file/d/1Vv1C4SMcZp4tf5elwyvIZlxUrslR0p-w/view?usp=drive_link",
      "ratings": 4.8,
      "description":
          "Indian dish consisting of grilled paneer cheese cubes in a creamy, spiced tomato-based sauce.",
      "people": 4,
      "quantity": 2,
      "saladIncluded": [],
      "reviews": []
    },
    {
      "id": 0004,
      "name": "Shahi Paneer",
      "category": "Main Course",
      "isVeg": true,
      "price": 1500,
      "imgUrl":
          "https://drive.google.com/file/d/1IGkw8yPeHyMiDNQI0F_cgu3oku49RvbA/view?usp=drive_link",
      "imgUrl2":
          "https://drive.google.com/file/d/1qo0O2-zF0oSjAHE4WsgPtY0g_0QfyztJ/view?usp=drive_link",
      "ratings": 4.5,
      "description":
          "Indian dish featuring soft paneer cubes simmered in a luxurious creamy gravy infused with aromatic spices, cashews, and cream, offering a decadent and royal dining experience.",
      "people": 4,
      "quantity": 2,
      "saladIncluded": [],
      "reviews": []
    },
    {
      "id": 0005,
      "name": "Chana Masala",
      "category": "Main Course",
      "isVeg": true,
      "price": 1250,
      "imgUrl":
          "https://drive.google.com/file/d/1pdq-d82lWrI_ErjnYneopwmNSsYTjFFw/view?usp=drive_link",
      "imgUrl2":
          "https://drive.google.com/file/d/1S_0k95udBgOhtVC-2pWTyT9K5at1x-kq/view?usp=drive_link",
      "ratings": 4.6,
      "description":
          "Indian dish consisting of tender chickpeas simmered in a flavorful tomato-based gravy, infused with aromatic spices like cumin, coriander, and garam masala.",
      "people": 4,
      "quantity": 2,
      "saladIncluded": [],
      "reviews": []
    },
    {
      "id": 0006,
      "name": "Mac n Cheese",
      "category": "Main Course",
      "isVeg": true,
      "price": 1000,
      "imgUrl":
          "https://drive.google.com/file/d/1ghqSk-atJ3bkcua6B1x6KzZ28fDhKnDS/view?usp=drive_link",
      "imgUrl2":
          "https://drive.google.com/file/d/1AoOwdHnHZVwdUNqr2KKwUr_qcCqRco0S/view?usp=drive_link",
      "ratings": 4.3,
      "description":
          "Originating from the United States, is a beloved comfort food consisting of macaroni pasta coated in a creamy cheese sauce.",
      "people": 4,
      "quantity": 2,
      "saladIncluded": [],
      "reviews": []
    },
    {
      "id": 0007,
      "name": "French Toast",
      "category": "Breakfast",
      "isVeg": true,
      "price": 800,
      "imgUrl":
          "https://drive.google.com/file/d/1jDNq0hTGkjTcQf7w0R80jDqahu4K780k/view?usp=drive_link",
      "imgUrl2":
          "https://drive.google.com/file/d/1Nl7EC7bWEGhKf3xc-AhPyhHHyJExh59I/view?usp=drive_link",
      "ratings": 4.7,
      "description":
          "Classic breakfast dish made by dipping slices of bread in a mixture of beaten eggs, milk, and spices, then frying them until golden brown.",
      "people": 4,
      "quantity": 2,
      "saladIncluded": [],
      "reviews": []
    },
    {
      "id": 0008,
      "name": "Bread Omlette",
      "category": "Breakfast",
      "isVeg": false,
      "price": 800,
      "imgUrl":
          "https://drive.google.com/file/d/1yuLhkZB9F7qruUKGM63laPwrCGZT68fF/view?usp=drive_link",
      "imgUrl2":
          "https://drive.google.com/file/d/1ltpBLVnDRSCSGqCvuDrGkiEknqWyEZ2I/view?usp=drive_link",
      "ratings": 4.6,
      "description":
          "A gourmet blend of fluffy omelette ensconced within artisanal bread slices.",
      "people": 4,
      "quantity": 2,
      "saladIncluded": [],
      "reviews": []
    },
    {
      "id": 0009,
      "name": "Cassata Ice Cream",
      "category": "Desserts",
      "isVeg": true,
      "price": 500,
      "imgUrl":
          "https://drive.google.com/file/d/1VL_i6o2IpiHTVgL4B0YgYbq5NSHuU6OC/view?usp=drive_link",
      "imgUrl2":
          "https://drive.google.com/file/d/1E1H8ikIokHtvY1LYIMNdxoXZeInwEtF9/view?usp=drive_link",
      "ratings": 4.6,
      "description":
          "A decadent dessert with layers of creamy ice cream, candied fruit, and nuts, all encased in a sponge cake shell, offering a delightful medley of flavors and textures.",
      "people": 4,
      "quantity": 2,
      "saladIncluded": [],
      "reviews": []
    },
    {
      "id": 0010,
      "name": "Kulfi Falooda",
      "category": "Desserts",
      "isVeg": true,
      "price": 500,
      "imgUrl":
          "https://drive.google.com/file/d/1xWFSYN_v7xQHSsYJXbkMdBoA9G4wUmQD/view?usp=drive_link",
      "imgUrl2":
          "https://drive.google.com/file/d/1hauqGPlGRHBJQhMyPLUjNrBmP0m_v4La/view?usp=drive_link",
      "ratings": 4.5,
      "description":
          "A luscious Indian dessert combining creamy kulfi ice cream, vermicelli noodles, rose syrup, and nuts.",
      "people": 4,
      "quantity": 2,
      "saladIncluded": [],
      "reviews": []
    }
  ];

  DocumentReference doc = FirebaseFirestore.instance.collection("Menu").doc("Menu");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            doc.set(
              {
                "items":foodItems,
              }
            );
          },
          child: Text("Add Food Items"),
        ),
      ),
    );
  }
}
