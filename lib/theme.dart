import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color primaryColor = Colors.blue[400];
Color secondaryColor = Color(0xffFFF6E0);
Color blackColor = Color(0xff252525);
Color whiteColor = Color(0xffFFFFFF);
Color greyColor = Color(0xff9F9F9F);
Color greyBgColor = Color(0xffF9F9F9);
Color greyInputColor = Color(0xffE4E4E4);
Color blueColor = Color(0xff008DCC);
Color pinkColor = Color(0xffF44771);
Color greenPrimaryColor = Color(0xff00FF1C);
Color greenSecondaryColor = Color(0xffCCFFD2);
Color purplePrimaryColor = Color(0xffBD00FF);
Color purpleSecondaryColor = Color(0xffF0C3FF);
Color blurColor = Color(0xffEFEFEF);

double edge = 24;

TextStyle blackTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w500,
  color: blackColor,
);

TextStyle whiteTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w500,
  color: whiteColor,
);

TextStyle greyTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w400,
  color: greyColor,
);

TextStyle primaryTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w400,
  color: primaryColor,
);

TextStyle regularTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w400,
  color: blackColor,
);

InputDecoration inputDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide.none,
  ),
  filled: true,
  fillColor: greyInputColor,
);

const kBackgroundColor = Color(0xFFF8F8F8);
const kActiveIconColor = Color(0xFFE68342);
const kTextColor = Color(0xFF222B45);
const kBlueLightColor = Color(0xFFC7B8F5);
const kBlueColor = Color(0xFF817DC0);
const kShadowColor = Color(0xFFE6E6E6);

const kGrey1 = Color(0xFF9F9F9F);
const kGrey2 = Color(0xFF6D6D6D);
const kGrey3 = Color(0xFFEAEAEA);
const kBlack = Color(0xFF1C1C1C);

var kNonActiveTabStyle = GoogleFonts.roboto(
  textStyle: TextStyle(fontSize: 14.0, color: kGrey1),
);

var kActiveTabStyle = GoogleFonts.roboto(
  textStyle: TextStyle(
    fontSize: 16.0,
    color: kBlack,
    fontWeight: FontWeight.bold,
  ),
);

var kCategoryTitle = GoogleFonts.roboto(
  textStyle: TextStyle(
    fontSize: 14.0,
    color: kGrey2,
    fontWeight: FontWeight.bold,
  ),
);

var kDetailContent = GoogleFonts.roboto(
  textStyle: TextStyle(
    fontSize: 14.0,
    color: kGrey2,
  ),
);

var kTitleCard = GoogleFonts.roboto(
  textStyle: TextStyle(
    fontSize: 18.0,
    color: kBlack,
    fontWeight: FontWeight.bold,
  ),
);

var descriptionStyle = GoogleFonts.roboto(
    textStyle: TextStyle(
  fontSize: 15.0,
  height: 2.0,
));
