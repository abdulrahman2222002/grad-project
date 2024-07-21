//
//
// import 'package:flutter/material.dart';
// import 'package:grad_project/constants/constants.dart';
// import 'package:grad_project/widgets/custom_button.dart';
// import 'package:grad_project/widgets/custom_text_form_field.dart';
// import 'package:sizer/sizer.dart';
//
// class AskForAge extends StatefulWidget {
//   const AskForAge({super.key});
//   static String id = 'AskForAge';
//
//   @override
//   State<AskForAge> createState() => _AskForAgeState();
// }
//
// class _AskForAgeState extends State<AskForAge> {
//   String? age;
//   GlobalKey<FormState> formKey = GlobalKey();
//   bool isAgeValid = false;
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
//                 Padding(
//                   padding: const EdgeInsets.only(
//                     left: 10.0,
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children:  [
//                       Text(
//                         'What is your Age?',
//                         style: TextStyle(
//                           fontSize: 17.sp,
//                           color: blueColor,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//
//                  SizedBox(
//                   height:MediaQuery.of(context).size.height / 30,
//                 ),
//                 BuildTextFormFeild(
//                   onChanged: (data) {
//                     age = data;
//                     setState(() {
//                       if (data.isEmpty) {
//                         isAgeValid = false;
//                       } else {
//                         isAgeValid = true;
//                       }
//                     });
//                   },
//                   keyboardType: TextInputType.number,
//                   isPassword: false,
//                   hintText: 'Age',
//                 ),
//                 const SizedBox(
//                   height: 60,
//                 ),
//                 BuildButton(
//                     title: 'Next',
//                     titleColor: whitColor,
//                     buttonColor: (isAgeValid) ?  blueColor:  maxGrayColor,
//                     height: 7.h,
//                     width: 100.w,
//                     onTap: () {
//                       if (formKey.currentState!.validate()) {
//                         isAgeValid
//                             ? Navigator.pushNamed(context, 'AskForName')
//                             : Null;
//                       }
//                     }),
//                 const SizedBox(
//                   height: 40,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     BuildButton(
//                         title: 'Skip>',
//                         titleColor: mainBlue,
//                         buttonColor:whitColor,
//
//                         onTap: () {
//                           Navigator.pushNamed(context, 'AskForName');
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
