import 'package:absensi_siswa/logged_in/home.dart';
import 'package:absensi_siswa/logged_in/teacher/add_students.dart';
import 'package:absensi_siswa/logged_in/teacher/attendance.dart';
import 'package:absensi_siswa/logged_in/teacher/batches.dart';
import 'package:absensi_siswa/logged_in/teacher/students.dart';
import 'package:absensi_siswa/screens/home_screen.dart';
import 'package:absensi_siswa/screens/onboarding_screen.dart';
import 'package:absensi_siswa/screens/splash_screen.dart';
import 'package:absensi_siswa/shared/account_settings.dart';
import 'package:absensi_siswa/shared/attendance_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:absensi_siswa/logged_out/authentication.dart';
import 'package:provider/provider.dart';
import 'package:absensi_siswa/classes/account.dart';

void main() => runApp(LoginApp());

class LoginApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<FirebaseUser>.value(
      value: User().account,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Attendance App ',
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => SplashScreen(),
          '/onboarding': (context) => OnBoardingPage(),
          '/batches': (context) => Batches(),
          '/enrolledStudents': (context) => EnrolledStudents(),
          '/addStudents': (context) => AddStudents(),
          '/addAttendance': (context) => AddAttendance(),
          '/attendanceList': (context) => AttendanceList(),
          '/homes': (context) => HomeScreen(),
          '/home_student_teacher': (context) => Home(),
          '/authentication': (context) => Authentication(),
          '/accountSettings': (context) => AccountSettings(),
        },
      ),
    );
  }
}
