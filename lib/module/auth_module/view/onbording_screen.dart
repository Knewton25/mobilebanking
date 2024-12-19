import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:airpay/uitily/String.dart';
import 'package:airpay/uitily/font_style.dart';
import 'package:airpay/module/auth_module/controller/on_boarding_controller.dart';
import 'package:airpay/module/auth_module/model/onboardingModel.dart';
import 'package:airpay/module/auth_module/view/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../uitily/color_uitily.dart';
import '../../../uitily/common_button.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorBg,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          body: Stack(
            children: [
              CarouselSlider(
                items: onBoardingList.map((e) => onBoardingPage(onBoardingData: e)).toList(),
                carouselController: OnBoardingController.to.buttonCarouselController,
                options: CarouselOptions(
                  autoPlay: false,
                  height: MediaQuery.of(context).size.height,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  viewportFraction: 1,
                  padEnds: false,
                  aspectRatio: 1,
                  initialPage: 0,
                  onPageChanged: (int index, CarouselPageChangedReason reason) {
                    OnBoardingController.to.onBoardingIndex.value = index;
                  },
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  StreamBuilder(
                      stream: OnBoardingController.to.onBoardingIndex.stream,
                      builder: (context, snapshot) {
                        return Center(
                          child: AnimatedSmoothIndicator(
                            count: onBoardingList.length,
                            textDirection: TextDirection.ltr,
                            axisDirection: Axis.horizontal,
                            onDotClicked: (index) {
                              index = OnBoardingController.to.onBoardingIndex.value;
                            },
                            effect: ExpandingDotsEffect(
                              dotColor: colorE5E7EB,
                              dotHeight: 8,
                              dotWidth: 10,
                              activeDotColor: colorPrimary,
                            ),
                            activeIndex: OnBoardingController.to.onBoardingIndex.value,
                          ),
                        );
                      }),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(MediaQuery.of(context).size.height * .02),
                      child: StreamBuilder(
                          stream: OnBoardingController.to.onBoardingIndex.stream,
                          builder: (context, snapshot) {
                            return commonButton(
                              onTap: () {
                                if (OnBoardingController.to.onBoardingIndex.value == 0) {
                                  OnBoardingController.to.buttonCarouselController.jumpToPage(2);
                                } else {
                                  Get.to(() => const LoginScreen());
                                }
                              },
                              title: OnBoardingController.to.onBoardingIndex.value == 0 ? AppString.next : AppString.getStarted,
                              width: MediaQuery.of(context).size.width - 100,
                            );
                          }),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget onBoardingPage({required OnBoardingModel onBoardingData}) {
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.045),
              child: Image.asset(
                onBoardingData.image ?? "",
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            StreamBuilder(
                stream: OnBoardingController.to.onBoardingIndex.stream,
                builder: (context, snapshot) {
                  return OnBoardingController.to.onBoardingIndex.value == 0
                      ? Positioned(
                          right: 24,
                          top: 24,
                          child: InkWell(
                            onTap: () {
                              OnBoardingController.to.buttonCarouselController.jumpToPage(2);
                            },
                            child: Text(
                              AppString.skip,
                              style: fontRed16W700,
                            ),
                          ),
                        )
                      : const SizedBox();
                }),
          ],
        ),
        SizedBox(width: 287, child: Text(onBoardingData.title ?? "", style: fontBlack24W700.copyWith(height: 1.4), textAlign: TextAlign.center)),
        SizedBox(height: MediaQuery.of(context).size.height * 0.025),
        SizedBox(width: 287, child: Text(onBoardingData.subTitle ?? "", style: fontGray14W400, textAlign: TextAlign.center)),
      ],
    );
  }
}
