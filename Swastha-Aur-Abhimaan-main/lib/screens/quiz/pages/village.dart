// import 'package:flutter/material.dart';
// import 'package:swastha_aur_swabhimaan/constants/constant.dart';
// import 'package:swastha_aur_swabhimaan/screens/quiz/pages/takeQuiz.dart';

// class Village extends StatefulWidget {
//   const Village({Key? key}) : super(key: key);

//   @override
//   State<Village> createState() => _VillageState();
// }

// class _VillageState extends State<Village> {
//   String village = "";
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           height: size.height,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage('Assets/images/background.png'),
//               fit: BoxFit.fitWidth,
//             ),
//           ),
//           child: Column(
//             children: [
//               SizedBox(
//                 height: size.height * 0.05,
//               ),
//               Text(
//                 'Visiting Village',
//                 style: TextStyle(
//                   fontSize: size.width * 0.08,
//                   fontWeight: FontWeight.w600,
//                   fontFamily: "Protrakt",
//                   color: Colors.black,
//                 ),
//               ),
//               Divider(
//                 color: Colors.black,
//                 thickness: 0.8,
//                 endIndent: size.width * 0.2,
//                 indent: size.width * 0.2,
//               ),
//               SizedBox(
//                 height: size.height * 0.1,
//               ),
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     village = "Vikasnagar";
//                   });
//                   nextScreen(context, TakeQuiz(village: village));
//                 },
//                 child: ClipRRect(
//                   child: Container(
//                     width: size.width * 0.7,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.elliptical(100, 60),
//                         bottomRight: Radius.elliptical(108, 50),
//                       ),
//                       border: Border.all(
//                         color: Colors.black,
//                         width: 0.8,
//                       ),
//                     ),
//                     child: Image.asset('Assets/images/vikasnagar.png'),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: size.height * 0.04,
//               ),
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     village = "Sahaspur";
//                   });
//                   nextScreen(context, TakeQuiz(village: village));
//                 },
//                 child: ClipRRect(
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.only(
//                         topRight: Radius.elliptical(50, 100),
//                         bottomRight: Radius.elliptical(50, 100),
//                       ),
//                       border: Border.all(
//                         color: Colors.black,
//                         width: 0.8,
//                       ),
//                     ),
//                     width: size.width * 0.7,
//                     child: Image.asset('Assets/images/sahaspur.png'),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: size.height * 0.04,
//               ),
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     village = "Doiwala";
//                   });
//                   nextScreen(context, TakeQuiz(village: village));
//                 },
//                 child: ClipRRect(
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.only(
//                         topRight: Radius.elliptical(100, 60),
//                         bottomLeft: Radius.elliptical(108, 50),
//                       ),
//                       border: Border.all(
//                         color: Colors.black,
//                         width: 0.8,
//                       ),
//                     ),
//                     width: size.width * 0.7,
//                     child: Image.asset('Assets/images/doiwala.png'),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.pop(context);
//         },
//         child: const Icon(
//           Icons.close,
//           color: Colors.black,
//         ),
//         backgroundColor: Color.fromARGB(190, 245, 203, 200),
//       ),
//     );
//   }
// }
