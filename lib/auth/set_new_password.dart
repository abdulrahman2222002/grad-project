// import 'package:flutter/material.dart';
// import 'package:grad_project/constants/constants.dart';
// import 'package:grad_project/widgets/custom_button.dart';
// import 'package:grad_project/widgets/custom_text_form_field.dart';
// import 'package:sizer/sizer.dart';

// class SetNewPassword extends StatefulWidget {
//   const SetNewPassword({Key? key}) : super(key: key);
//   static String id = 'SetNewPassword';

//   @override
//   State<SetNewPassword> createState() => _SetNewPasswordState();
// }

// class _SetNewPasswordState extends State<SetNewPassword> {
//   String? email;
//   String? pass;
//   GlobalKey<FormState> formKey = GlobalKey();
//   bool visible1 = true;
//   bool visible2 = true;
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
//           leading:  Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: IconButton(
//               icon: const Icon(Icons.arrow_back_ios_rounded),
//               onPressed: (){
//                 Navigator.pop(context);
//               },
//               color: cyanBlueColor,
//             ),
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.only(
//             top: 15.0,
//             right: 8,
//             left: 8,
//           ),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 10.0,),
//                   child: Row(
//                     children:  [
//                       Text(
//                         'Set new password',
//                         style: TextStyle(
//                           fontSize: 23.sp,
//                           color: blueColor,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                  SizedBox(height:MediaQuery.of(context).size.height / 40,),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 10.0),
//                   child: Row(
//                     children:  [
//                       Text(
//                         'Enter your new password below..',
//                         maxLines: 2,
//                         style: TextStyle(
//                             fontSize: 13.sp,
//                             color: blueColor,
//                             fontWeight: FontWeight.w400,
//                             height: 0.1.h,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                  SizedBox(
//                   height:MediaQuery.of(context).size.height / 25,
//                 ),
//                 BuildTextFormFeild(
//                   onChanged: (data) {
//                     pass = data;
//                   },
//                   prefixIcon: Icons.lock_outline,
//                   keyboardType: TextInputType.visiblePassword,
//                   suffixIcon: visible1
//                       ? Icons.visibility_outlined
//                       : Icons.visibility_off_outlined,
//                   visibilityTaped: () {
//                     setState(() {
//                       visible1 = !visible1;
//                     });
//                   },
//                   isPassword: visible1,
//                   hintText: 'New Password',
//                 ),
//                 SizedBox(height:MediaQuery.of(context).size.height / 20,),
//                 BuildTextFormFeild(
//                   onChanged: (data) {
//                     pass = data;
//                   },
//                   prefixIcon: Icons.lock_outline,
//                   keyboardType: TextInputType.visiblePassword,
//                   suffixIcon: visible2
//                       ? Icons.visibility_outlined
//                       : Icons.visibility_off_outlined,
//                   visibilityTaped: () {
//                     setState(() {
//                       visible2 = !visible2;
//                     });
//                   },
//                   isPassword: visible2,
//                   hintText: 'Confirm New Password',
//                 ),
//                  SizedBox(
//                  height: MediaQuery.of(context).size.height / 10,
//                 ),
//                 BuildButton(
//                     title: 'Submit',
//                     titleColor: whitColor,
//                     buttonColor: maxGrayColor,
//                     height: 7.h,
//                     width: 70.w,
//                     onTap: () {}
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
