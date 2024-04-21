import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mprapp/screens/orders/mybookings.dart';
import 'package:mprapp/screens/orders/orderinfo.dart';
import 'package:uuid/uuid.dart';
import 'package:mprapp/controllerfiles/tablecontroller.dart';

class MyOrders extends StatelessWidget {
  final tableController = Get.put(TableController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.05,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Persons",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: size.width * 0.06),
            ),
            DropdownMenu(
              width: size.width * 0.4,
              initialSelection: "2",
              onSelected: (val) {
                tableController.val.value = int.parse(val.toString());
              },
              dropdownMenuEntries: const [
                DropdownMenuEntry(value: "2", label: "2 people"),
                DropdownMenuEntry(value: "3", label: "3 people"),
                DropdownMenuEntry(value: "4", label: "4 people"),
                DropdownMenuEntry(value: "5", label: "5 people"),
                DropdownMenuEntry(value: "8", label: ">5 people"),
              ],
            ),
            ElevatedButton(onPressed: (){
              Get.to(()=>OrderInfo());
            }, child: Text("Book"),),

          ],
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Expanded(
          child: Obx(
            () => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      (tableController.val.value == 2 ||
                              tableController.val.value == 4)
                          ? 'assets/tables1.jpg'
                          : 'assets/tables2.jpg',
                    ),
                    fit: BoxFit.contain),
              ),
              child: Obx(() => stacks(size)),
            ),
          ),
        ),
      ],
    );
  }

  Widget stacks(Size size) {
    if (tableController.val.value == 4) {
      return Stack(
        children: [
          //Left Tables
          Positioned(
            top: size.height * 0.055,
            left: size.width * 0.055,
            child: Container(
              width: size.width * 0.175,
              height: size.height * 0.05,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size.width * 0.02),
                color: Colors.green,
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.2,
            left: size.width * 0.055,
            child: Container(
              width: size.width * 0.175,
              height: size.height * 0.05,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size.width * 0.02),
                color: Colors.green,
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.344,
            left: size.width * 0.055,
            child: Container(
              width: size.width * 0.175,
              height: size.height * 0.05,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size.width * 0.02),
                color: Colors.green,
              ),
            ),
          ),
          //Right Tables
          Positioned(
            top: size.height * 0.055,
            right: size.width * 0.042,
            child: Container(
              width: size.width * 0.175,
              height: size.height * 0.05,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size.width * 0.02),
                color: Colors.green,
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.2,
            right: size.width * 0.042,
            child: Container(
              width: size.width * 0.175,
              height: size.height * 0.05,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size.width * 0.02),
                color: Colors.green,
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.344,
            right: size.width * 0.042,
            child: Container(
              width: size.width * 0.175,
              height: size.height * 0.05,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size.width * 0.02),
                color: Colors.green,
              ),
            ),
          ),
        ],
      );
    } else if (tableController.val.value == 2) {
      return Stack(
        children: [
          Positioned(
            top: size.height * 0.055,
            left: size.width * 0.42,
            child: Container(
              width: size.width * 0.175,
              height: size.height * 0.05,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.2,
            left: size.width * 0.42,
            child: Container(
              width: size.width * 0.175,
              height: size.height * 0.05,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
            ),
          ),
        ],
      );
    }
    else if(tableController.val.value == 5) {
      return Stack(
        children: [
          Positioned(
            top: size.height * 0.09,
            left: size.width * 0.37,
            child: Container(
              width: size.width * 0.22,
              height: size.height * 0.053,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size.width * 0.02),
                color: Colors.green,
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.09,
            left: size.width * 0.038,
            child: Container(
              width: size.width * 0.22,
              height: size.height * 0.053,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size.width * 0.02),
                color: Colors.green,
              ),
            ),
          ),
        ],
      );
    }
    else if (tableController.val.value == 3) {
      return Stack(
        children: [
          Positioned(
            bottom: size.height * 0.096,
            left: size.width * 0.4,
            child: Container(
              width: size.width * 0.175,
              height: size.height * 0.05,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
            ),
          ),
          Positioned(
            bottom: size.height * 0.096,
            left: size.width * 0.21,
            child: Container(
              width: size.width * 0.175,
              height: size.height * 0.05,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
            ),
          ),
          Positioned(
            bottom: size.height * 0.096,
            left: size.width * 0.016,
            child: Container(
              width: size.width * 0.175,
              height: size.height * 0.05,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
            ),
          ),
          Positioned(
            bottom: size.height * 0.096,
            left: size.width * 0.59,
            child: Container(
              width: size.width * 0.175,
              height: size.height * 0.05,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
            ),
          ),
          Positioned(
            bottom: size.height * 0.096,
            left: size.width * 0.785,
            child: Container(
              width: size.width * 0.175,
              height: size.height * 0.05,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
            ),
          ),
        ],
      );
    }
    return Stack(
      children: [
        Positioned(
          top: size.height * 0.305,
          left: size.width * 0.14,
          child: Container(
            width: size.width * 0.44,
            height: size.height * 0.06,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size.width * 0.02),
              color: Colors.green,
            ),
          ),
        ),
      ],
    );
  }
}
