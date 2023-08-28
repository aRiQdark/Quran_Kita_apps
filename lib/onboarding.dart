import 'package:alquran/animation.dart';
import 'package:alquran/onboarding2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

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
              "Hello GRD",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 38,
            ),
            Image.asset(
              "assets/images/alquran-transparan.png",
              height: 257,
            ),
            SizedBox(
              height: 120,
            ),
            Text(
              "Next for tobat",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 60),
                    backgroundColor: Color(0xff00A656)),
                onPressed: () => Get.to(Onboarding2()),
                child: Icon(
                  Icons.arrow_forward_ios,
                ))
          ],
        ),
      )),
    );
  }
}
