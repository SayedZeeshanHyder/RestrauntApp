import 'dart:async';

import 'package:get/get.dart';

class SplashAnimation extends GetxController
{
  RxDouble txt1Op = 0.0.obs;
  RxDouble txt2Op = 0.0.obs;

  txt1Animate()
  {
    Timer(const Duration(milliseconds: 100),(){
      txt1Op.value = 1.0;
    });
  }

  txt2Animate()
  {
    Timer(const Duration(milliseconds: 2000),(){
      txt2Op.value = 1.0;
    });
  }
}