// ignore_for_file: prefer_const_constructors, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:absensi_siswa/theme.dart';
import 'package:get_storage/get_storage.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatelessWidget {
  OnBoardingPage({Key key}) : super(key: key);

  final box = GetStorage();

  @override
  Widget build(BuildContext context) => SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'Sekolah',
              body:
                  'Welcome to SD Negeri 1 Taman Sari',
              image: buildImage('assets/images/logo-tut-wuri.png'),
              decoration: getPageDecoration(),
            ),
          ],
          done: Container(
              width: 100,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: primaryColor,
              ),
              child: Center(
                child: Text('Mengerti',
                    style: whiteTextStyle.copyWith(fontSize: 16)),
              )),
          onDone: () => goToHome(context),
          showSkipButton: true,
          skip: Text('Lewati', style: greyTextStyle.copyWith(fontSize: 16)),
          onSkip: () => goToHome(context),
          next: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: primaryColor,
            ),
            child: Icon(
              Icons.arrow_forward,
              color: whiteColor,
            ),
          ),
          dotsDecorator: getDotDecoration(),
        ),
      );

  void goToHome(context) {
    box.write('isBoardingDone', true);
    Navigator.pushReplacementNamed(context, '/authentication');
  }

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: greyInputColor,
        activeColor: primaryColor,
        size: Size(10, 10),
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: blackTextStyle.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        bodyTextStyle: greyTextStyle.copyWith(
          fontSize: 14,
        ),
        imagePadding: EdgeInsets.all(24),
        pageColor: greyBgColor,
      );
}
