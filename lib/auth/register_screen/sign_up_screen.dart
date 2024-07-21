// ignore_for_file: must_be_immutable, avoid_print, unused_element, unused_local_variable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../constants/constants.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../auth_provider/register_provider.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key, }) : super(key: key);
  static String id = 'RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? confirmPass;
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  GlobalKey<FormState> formKey = GlobalKey();
  bool visible1 = true;
  bool visible2 = true;
  bool isPasswordValid = true;
  bool isNameValid = true;
  bool isConfirmPasswordValid = true;

  // String name = '';
  // String email = '';
  // String pass = '';

  TextEditingController? nameController=TextEditingController();
  TextEditingController? mailController=TextEditingController();
  TextEditingController? passController=TextEditingController();
  TextEditingController? confirmPassController=TextEditingController();

  bool isEmailValid(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'+/=?^_`{|}~-]+)|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])")@(?:(?:[a-z0-9](?:[a-z0-9-]'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value) ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: whitColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: whitColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
            color: cyanBlueColor,
          ),
        ),
        body: Consumer<RegisterViewModel>(
          builder: (context, registerViewModel, child) => Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              right: 8,
              left: 8,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 117,
                  ),
                  Row(
                    children: [
                      Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 23.sp,
                          color: blueColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 23,
                  ),
                  BuildTextFormFeild(
                    controller: nameController,
                    onSaved: (data) {
                      // name = data!;
                      // setState(() {
                      //   if (data.length < 7) {
                      //     isNameValid = true;
                      //   } else {
                      //     isNameValid = false;
                      //   }
                      // });
                    },
                    prefixIcon: Icons.person_outline,
                    keyboardType: TextInputType.name,
                    isPassword: false,
                    hintText: 'Full Name',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 32,
                  ),
                  BuildTextFormFeild(
                    controller: mailController,
                    onSaved: (data) {
                      // email = data!;
                    },
                    prefixIcon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    isPassword: false,
                    hintText: 'Email',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 32,
                  ),
                  BuildTextFormFeild(
                    controller: passController,
                    onSaved: (data) {
                      // pass = data!;
                      // setState(() {
                      //   if (data.length < 6 && pass != confirmPass) {
                      //     isPasswordValid = true;
                      //   } else {
                      //     isPasswordValid = false;
                      //   }
                      // });
                    },
                    prefixIcon: Icons.lock_outline,
                    keyboardType: TextInputType.visiblePassword,
                    suffixIcon: visible1
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    visibilityTaped: () {
                      setState(() {
                        visible1 = !visible1;
                      });
                    },
                    isPassword: visible1,
                    hintText: 'Password',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 32,
                  ),
                  BuildTextFormFeild(
                    controller: confirmPassController,
                    onSaved: (data) {
                      confirmPass = data;
                      // setState(() {
                      //   if (pass != confirmPass) {
                      //     isConfirmPasswordValid = true;
                      //   } else {
                      //     isConfirmPasswordValid = false;
                      //   }
                      // });
                    },
                    prefixIcon: Icons.lock_outline,
                    keyboardType: TextInputType.emailAddress,
                    suffixIcon: visible2
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    visibilityTaped: () {
                      setState(() {
                        visible2 = !visible2;
                      });
                    },
                    isPassword: visible2,
                    hintText: 'Confirm Password',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 25,
                  ),
                  BuildButton(
                      title: 'Sign Up',
                      titleColor: whitColor,
                      buttonColor: (isPasswordValid ||
                              isNameValid ||
                              isConfirmPasswordValid)
                          ? maxGrayColor
                          : blueColor,
                      height: 7.h,
                      width: 100.w,
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          if (isEmailValid(mailController?.text)==false) {
                            Fluttertoast.showToast(
                                msg: 'البريد الإلكتروني غير صالح');
                          } else {
                            if (passController?.text ==
                                confirmPassController?.text) {
                              formKey.currentState!.save();
                              var reqData = {
                                "name": nameController?.text,
                                "email": mailController?.text,
                                "confirmPassword": confirmPassController?.text,
                                "password": passController?.text
                              };
                              await context
                                  .read<RegisterViewModel>()
                                  .register(reqData: reqData,ctx: context);
                              
                            }else{
                              Fluttertoast.showToast(
                                msg: 'كلمة المرور غير متطابقه');
                            }
                          }
                        } else {
                          setState(() {
                            autoValidateMode = AutovalidateMode.always;
                          });
                        }
                      }
//async {
                      //   if (formKey.currentState!.validate()) {
                      //     try {
                      //       await registerUser();
                      //       Navigator.pushNamed(context, 'LoginScreen');
                      //     } on FirebaseAuthException catch (e) {
                      //       print('Failed with error code: ${e.code}');
                      //       print('Message: ${e.message}');
                      //       if (e.code == 'weak-password') {
                      //         showSnackBar(
                      //           context,
                      //           'The password provided is too weak.\npassword must be at least 6 characters',
                      //         );
                      //       } else if (e.code == 'email-already-in-use') {
                      //         showSnackBar(
                      //           context,
                      //           'The account already exists for that email.',
                      //         );
                      //       } else if (e.code == 'invalid-email') {
                      //         showSnackBar(
                      //           context,
                      //           'Pleas enter correct email address',
                      //         );
                      //       } else if (pass != confirmPass) {
                      //         showSnackBar(
                      //           context,
                      //           'Pleas enter correct email address',
                      //         );
                      //       }
                      //     }
                      //   }
                      // },
                      ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account ? ',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: blueColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, 'LoginScreen');
                        },
                        child: Text(
                          'Sing In',
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: blueColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Future<void> registerUser() async {
  //   UserCredential user =
  //       await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //     email: email!,
  //     password: pass!,
  //   );
  // }

  Future<void> _showMyDialog(String x) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Warning'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(x),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
