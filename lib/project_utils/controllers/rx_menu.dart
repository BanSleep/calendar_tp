import 'package:get/get.dart';

class RxMenu extends GetxController {
  Rx<int> currentIndex = 0.obs;
  int initIndex = 0;
  int lastIndex = 0;
  bool isComment = false;
  RxMenu({this.initIndex = 0}){
    lastIndex = initIndex;
    currentIndex = initIndex.obs;
  }

  void updateIndex(int index){
    lastIndex = currentIndex.value;
    currentIndex.value = index;
    update();
  }
}