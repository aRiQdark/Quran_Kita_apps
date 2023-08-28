import 'package:alquran/animation.dart';
import 'package:alquran/homequran.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff171212),
      body: Center(
          child: animation(
        1,
        130,
        Column(
          children: [
            SizedBox(
              height: 140,
            ),
            Text(
              "Hafizd",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 38,
            ),
            Image.asset(
              "assets/images/masjid.png",
              height: 257,
            ),
            SizedBox(
              height: 70,
            ),
            Text(
              "Learn Quran",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Every Day",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  ),
            ),
            SizedBox(
              height: 70,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 60),
                    backgroundColor: Color(0xff00A656)),
                onPressed: () => Get.to(beranda()),
                child: Text("Get Started"))
          ],
        ),
      )),
    );
  }
}
