import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController{
  static OnBoardingController get to => Get.find();


  CarouselController buttonCarouselController = CarouselController();
  PageController indicatorController = PageController();
  RxInt onBoardingIndex = 0.obs;
  RxInt onIndicatorIndex = 0.obs;

}