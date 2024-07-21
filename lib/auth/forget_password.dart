// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:grad_project/constants/constants.dart';
// import 'package:grad_project/helper/build_widgets.dart';
// import 'package:grad_project/widgets/custom_button.dart';
// import 'package:grad_project/widgets/custom_text_form_field.dart';
// import 'package:sizer/sizer.dart';

// class ForgetPassword extends StatefulWidget {
//   const ForgetPassword({Key? key}) : super(key: key);
//   static String id = 'ForgetPassword';

//   @override
//   State<ForgetPassword> createState() => _ForgetPasswordState();
// }

// class _ForgetPasswordState extends State<ForgetPassword> {
//   String? email;
//   bool isEmailValid = true;

//   GlobalKey<FormState> formKey = GlobalKey();
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
//           leading:  IconButton(
//             icon: const Icon(Icons.arrow_back_ios_rounded),
//             onPressed: (){
//               Navigator.pop(context);
//             },
//             color: cyanBlueColor,
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
//                         'Forgot Password !!',
//                         style: TextStyle(
//                             fontSize: 23.sp,
//                             color: blueColor,
//                             fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                  SizedBox(height:MediaQuery.of(context).size.height / 30,),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 10.0),
//                   child: Row(
//                     children:  [
//                       Text(
//                         'Input your email address \nto fix the issue.',
//                         maxLines: 3,
//                         style: TextStyle(
//                             fontSize: 13.sp,
//                             color: blueColor,
//                             fontWeight: FontWeight.w400,
//                           height: 1.3
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                  SizedBox(
//                   height:MediaQuery.of(context).size.height / 30,
//                 ),
//                 BuildTextFormFeild(
//                   onChanged: (data) {
//                     email = data;
//                     setState(() {
//                       if (data.length<10) {
//                         isEmailValid = true;
//                       } else {
//                         isEmailValid = false;
//                       }
//                     });
//                   },
//                   prefixIcon: Icons.email_outlined,
//                   keyboardType: TextInputType.emailAddress,
//                   isPassword: false,
//                   hintText: 'example@gmail.com',
//                   label: 'Email',
//                 ),
//                  SizedBox(
//                   height:MediaQuery.of(context).size.height / 5,
//                 ),
//                 BuildButton(
//                     title: 'Submit',
//                     titleColor: whitColor,
//                     buttonColor: isEmailValid ? maxGrayColor: blueColor,
//                   height: 7.h,
//                   width: 70.w,
//                     onTap: ()   async {
//                     if (formKey.currentState!.validate()) {
//                       try {
//                         await forgetPassword();
//                         Navigator.pushNamed(context, 'SetNewPassword');
//                       } on FirebaseAuthException catch (e) {
//                         if (e.code == 'user-not-found') {
//                           showSnackBar(
//                             context,
//                             'No user found for that email.',
//                           );
//                         }else {
//                           showSnackBar(
//                             context,
//                             'No user found for that email.',
//                           );
//                         }
//                       }
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//   Future<void> forgetPassword() async {
//     await FirebaseAuth.instance.sendPasswordResetEmail(
//       email: email!,
//     );
//   }
// }
