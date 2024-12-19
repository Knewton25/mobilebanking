import 'package:airpay/uitily/String.dart';

class OnBoardingModel {
  String? image;
  String? title;
  String? subTitle;
  String? buttonTitle;

  OnBoardingModel({this.image, this.title, this.buttonTitle, this.subTitle});
}

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      image: "assets/images/onBoardingimage1.png",
      title: AppString.onBoardingTitle1,
      subTitle: AppString.onBoardingSubTitle1,
      buttonTitle: AppString.next),
  OnBoardingModel(
      image: "assets/images/onBoardingimage2.png",
      title: AppString.onBoardingTitle2,
      subTitle: AppString.onBoardingSubTitle2,
      buttonTitle: AppString.getStarted),
];
