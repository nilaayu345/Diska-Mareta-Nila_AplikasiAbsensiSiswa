import 'package:absensi_siswa/classes/account.dart';
import 'package:absensi_siswa/classes/firestore.dart';
import 'package:absensi_siswa/logged_in/home.dart';
import 'package:absensi_siswa/logged_in/student/home.dart';
import 'package:absensi_siswa/logged_in/verification.dart';
import 'package:absensi_siswa/logged_out/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:absensi_siswa/screens/gallery_screen.dart';
import 'package:absensi_siswa/screens/news/news_screen.dart';
import 'package:absensi_siswa/screens/school_screen.dart';
import 'package:absensi_siswa/theme.dart';
import 'package:absensi_siswa/widgets/menu_card.dart';
import 'package:absensi_siswa/widgets/search_bar.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isEmailVerified;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments;
    String type = data['type'];
    isEmailVerified = data['isEmailVerified'];
    Widget homeScreen;
    homeScreen = type == 'Student'
        ? StudentHome()
        : HomeScreenApp(type, isEmailVerified);
    return isEmailVerified ? homeScreen : VerifyEmail();
  }
}

class HomeScreenApp extends StatelessWidget {
  String type;
  bool isEmailVerified;
  HomeScreenApp(this.type, this.isEmailVerified);
  FirebaseUser _user;
  String _userName = '';

  Future setup(FirebaseUser userCurrent, String sub) async {
    _user = userCurrent;
    _userName = await UserDataBase(_user).userName();
    if (_userName == null) {
      _userName = 'Can\'t Get Name';
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            // Here the height of the container is 45% of our total height
            height: size.height * .45,
            decoration: BoxDecoration(
              color: primaryColor,
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset("assets/images/logo-tut-wuri.png"),
                    ),
                  ),
                  Text(
                    "Good Morning \n" + _userName,
                    style: whiteTextStyle.copyWith(fontWeight: FontWeight.w900),
                  ),
                  SearchBar(),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        MenuCard(
                          title: "Sekolah",
                          svgSrc: "assets/images/ic_school.png",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return SchoolPage();
                              }),
                            );
                          },
                        ),
                        MenuCard(
                          title: "Absensi",
                          svgSrc: "assets/images/ic_attendance.png",
                          press: () {
                            Navigator.pushNamed(
                                context, '/home_student_teacher', arguments: {
                              'type': type,
                              'isEmailVerified': isEmailVerified
                            });
                          },
                        ),
                        MenuCard(
                          title: "Berita",
                          svgSrc: "assets/images/ic_news.png",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return NewsScreen();
                              }),
                            );
                          },
                        ),
                        MenuCard(
                          title: "Gallery",
                          svgSrc: "assets/images/ic_gallery.png",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return GalleryScreen();
                              }),
                            );
                          },
                        ),
                        MenuCard(
                          title: "Logout",
                          svgSrc: "assets/images/ic_logout.png",
                          press: () async {
                            dynamic result = await User().signOut();
                            if (result == null) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return Authentication();
                                }),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
