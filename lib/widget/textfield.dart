// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// class TextFieldWidget extends StatelessWidget {
//    TextFieldWidget({Key? key,required this.myController,required this.type}) : super(key: key);
// TextEditingController myController;
// TextInputType type;
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       margin: const EdgeInsets.symmetric(horizontal: 20),
//       child: TextFormField(
//         controller: myController,
//         keyboardType: TextInputType.text,
//         obscureText: true,
//         decoration: InputDecoration(
//           enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(50),
//               borderSide: const BorderSide(
//                 color: Colors.black,
//               )),
//           focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(50),
//
//               borderSide: const BorderSide(
//                 color: Colors.black,
//               )),
//           labelText: "Enter your Password",
//           labelStyle: TextStyle(color: Colors.black),
//           prefixIcon: const Icon(
//             Icons.lock,
//             color: Colors.black,
//           ),
//         ),
//
//       ),
//     );
//   }
// }
