// import 'package:flutter/material.dart';
// import 'package:grad_project/constants/constants.dart';
// import 'package:grad_project/widgets/custom_button.dart';
// import 'package:grad_project/widgets/custom_text_form_field.dart';
// import 'package:sizer/sizer.dart';
// class AskForName extends StatefulWidget {
//   const AskForName({super.key});
//   static String id = 'AskForName';
//
//   @override
//   State<AskForName> createState() => _AskForNameState();
// }
//
// class _AskForNameState extends State<AskForName> {
//   String? name;
//   GlobalKey<FormState> formKey = GlobalKey();
//   bool isNameValid = false;
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: formKey,
//       child: Scaffold(
//         backgroundColor: whitColor,
//         appBar: AppBar(
//           centerTitle: true,
//           elevation: 0,
//           backgroundColor: whitColor,
//           leading: Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: IconButton(
//               icon: const Icon(Icons.arrow_back_ios_rounded),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               color: cyanBlueColor,
//             ),
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.only(
//             top: 40.0,
//             right: 8,
//             left: 8,
//           ),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children:  [
//                     Text(
//                       'What is your name?',
//                       style: TextStyle(
//                         fontSize: 17.sp,
//                         color: blueColor,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ],
//                 ),
//                  SizedBox(
//                   height:MediaQuery.of(context).size.height / 30,
//                 ),
//                 BuildTextFormFeild(
//                   onChanged: (data) {
//                     name = data;
//                     setState(() {
//                       if (data.isEmpty) {
//                         isNameValid = false;
//                       } else {
//                         isNameValid = true;
//                       }
//                     });
//                   },
//                   keyboardType: TextInputType.name,
//                   isPassword: false,
//                   hintText: 'Name',
//                 ),
//                  SizedBox(
//                   height:MediaQuery.of(context).size.height / 10,
//                 ),
//                 BuildButton(
//                     title: 'Next',
//                     titleColor: whitColor,
//                     buttonColor: (isNameValid) ? blueColor : maxGrayColor,
//                     height: 7.h,
//                     width: 100.w,
//                     onTap: () {
//                       if (formKey.currentState!.validate()) {
//                         isNameValid
//                             ? Navigator.pushNamed(context, 'AskForAge')
//                             : Null;
//                       }
//
//                     }),
//                  SizedBox(
//                   height:MediaQuery.of(context).size.height / 15,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     BuildButton(
//                         title: 'Skip>',
//                         titleColor: mainBlue,
//                         buttonColor: whitColor,
//                         onTap: () {
//                           Navigator.pushNamed(context, 'AskForAge');
//                         }),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
