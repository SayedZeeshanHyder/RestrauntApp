import 'package:get/get.dart';

class LoadingController extends GetxController {

  RxBool isLoading = false.obs;

  loadingCompleted() {
    isLoading.value = false;
    print(isLoading.value);
  }

  loadingStarted()
  {
    isLoading.value = true;
    print(isLoading.value);
  }

}