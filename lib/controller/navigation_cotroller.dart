import 'package:get/get.dart';

class NavigationController extends GetxController{

  RxInt currentPage = 0.obs;

  void setPage(int pageIdx){
    currentPage.value = pageIdx;
    // print(pageIdx);
  }

}