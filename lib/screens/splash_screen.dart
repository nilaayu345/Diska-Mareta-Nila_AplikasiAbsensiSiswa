// ignore_for_file: prefer_const_constructors, import_of_legacy_library_into_null_safe

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:absensi_siswa/theme.dart';
import 'package:get_storage/get_storage.dart';

final box = GetStorage();

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AnimationController _controller;
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => {
              if (box.read('isBoardingDone') == true)
                {
                  Navigator.pushReplacementNamed(context, '/authentication'),
                }
              else
                {
                  Navigator.pushReplacementNamed(context, '/onboarding'),
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width / 2,
              ),
              Image.asset(
                'assets/images/logo-tut-wuri.png',
                width: MediaQuery.of(context).size.width - (edge * 2),
              ),
              Spacer(),
              Text(
                'Nama Sekolah',
                style: whiteTextStyle.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              Text(
                'By Nama kami',
                style: whiteTextStyle.copyWith(
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
