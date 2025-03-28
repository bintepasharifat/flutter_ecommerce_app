import 'package:flutter/material.dart';
import 'package:flutter_application_7/utils/colors.dart';

class MyBanner extends StatelessWidget {
  const MyBanner({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.20,
      width: size.width,
      color: bannerColor,
      child: Padding(
        padding: EdgeInsets.only(left: 20),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "NEW COLLECTIONS",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -2),
                ),
                Row(
                  children: [
                    Text(
                      "20",
                      style: TextStyle(
                          fontSize: 40,
                          height: 0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -3),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "%",
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                        Text(
                          "OFF",
                          style: TextStyle(
                              fontSize: 10,
                              letterSpacing: -1.5,
                              fontWeight: FontWeight.bold,
                              height: 0),
                        )
                      ],
                    )
                  ],
                ),
                MaterialButton(
                  onPressed: () {},
                  color: Colors.black,
                  child: Text(
                    "SHOP NOW",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                "assets/logo/image.png",
                height: size.height * 0.18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
