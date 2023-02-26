import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppLogo {
  appLogo() {
    return Container(
      height: 70,
      width: 70,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/app_logo.png"),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

// class backGroundImage {
//   buildBackgroundImageBlur() {
//     return ClipRect(
//       child: Stack(
//         children: [
//           Container(
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage("assets/files/money.json"),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           const Positioned(
//             bottom: 30,
//             right: 5,
//             height: 150,
//             width: 300,
//             child: Text(
//               "We help you plan a  financially stable and secure future for you & your loved ones.",
//               style: TextStyle(fontSize: 24, color: Colors.white),
//             ),
//           )
//         ],
//       ),
//     );
//   }

  // backGroundImageThree() {
  //   return Stack(
  //     children: [
  //       Container(
  //         child: Lottie.network(
  //             "https://assets10.lottiefiles.com/private_files/lf30_ghysqmiq.json"),
  //       ),
  //       const Positioned(
  //         bottom: 30,
  //         right: 5,
  //         height: 150,
  //         width: 300,
  //         child: Text(
  //           "We help you plan a  financially stable and secure future for you & your loved ones.",
  //           style: TextStyle(fontSize: 24, color: Colors.black),
  //         ),
  //       )
  //     ],
  //   );
  // }

