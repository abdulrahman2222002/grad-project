// ignore_for_file: must_be_immutable, unused_element, unused_local_variable

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../constants/constants.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../auth_provider/login_provider.dart';
import '../register_screen/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;
  String? pass;
  TextEditingController? mailController=TextEditingController();
  TextEditingController? passController=TextEditingController();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  GlobalKey<FormState> formKey = GlobalKey();
  bool visible = true;
  bool isEmailValid = true;
  bool isPasswordValid = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: whitColor,
        body: Consumer<LoginViewModel>(
          builder: (context, loginViewModel, child) => Padding(
            padding: const EdgeInsets.only(
              top: 15.0,
              right: 8,
              left: 8,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                  ),
                  Image.asset(
                    'assets/images/splash1.jpg',
                    width: 50.w,
                    height: 20.h,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 300,
                  ),
                  Row(
                    children: [
                      Text(
                        'Sign in',
                        style: TextStyle(
                            fontSize: 23.sp,
                            color: blueColor,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 54,
                  ),
                  BuildTextFormFeild(
                    controller: mailController,
                    onSaved: (data) {
                      email = data;
                      setState(() {
                        if (data!.length < 10) {
                          isEmailValid = true;
                        } else {
                          isEmailValid = false;
                        }
                      });
                    },
                    prefixIcon: Icons.person_outline,
                    keyboardType: TextInputType.emailAddress,
                    isPassword: false,
                    hintText: 'Email or User Name',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 45,
                  ),
                  BuildTextFormFeild(
                    controller: passController,
                    onSaved: (data) {
                      pass = data;
                      setState(() {
                       
                      });
                    },
                    prefixIcon: Icons.lock_outline,
                    keyboardType: TextInputType.visiblePassword,
                    suffixIcon: visible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    visibilityTaped: () {
                      setState(() {
                        visible = !visible;
                      });
                    },
                    isPassword: visible,
                    hintText: 'Password',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 54,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, 'ForgetPassword');
                        },
                        child: Text(
                          'Forget Password ?',
                          style: TextStyle(
                              fontSize: 13.sp,
                              color: blueColor,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 45,
                  ),
                  loginViewModel.isLoading == false
                      ? BuildButton(
                          title: 'Sign in',
                          titleColor: whitColor,
                          buttonColor: (isEmailValid || isPasswordValid)
                              ? maxGrayColor
                              : blueColor,
                          height: 7.h,
                          width: 100.w,
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              var reqData = {"email": mailController?.text, "password": passController?.text};
                              await context
                                  .read<LoginViewModel>()
                                  .login(reqData: reqData,ctx: context);
                             
                            }else{
                              formKey.currentState!.save();
                              setState(() {
                                autoValidateMode = AutovalidateMode.always;
                              });
                            }
                          } //async {
                          //   if (formKey.currentState!.validate()) {
                          //     try {
                          //       await loginUser();z
                          //       Navigator.pushNamed(context, 'AskForName');
                          //     } on FirebaseAuthException catch (e) {
                          //       // ignore: avoid_print
                          //       print('Failed with error code: ${e.code}');
                          //       // ignore: avoid_print
                          //       print('Message: ${e.message}');
                          //       if (e.code == 'unknown') {
                          //         showSnackBar(
                          //           context,
                          //           'Login failed!!\nThe email address or password you entered is incorrect.\nPlease enter correct email and password',
                          //         );
                          //       } else if (e.code == 'too-many-requests') {
                          //         showSnackBar(
                          //           context,
                          //           'We have blocked all requests from this device due to unusual activity. Try again later.',
                          //         );
                          //       } else if (e.code == 'invalid-email') {
                          //         showSnackBar(
                          //           context,
                          //           'invalid email\nEmail must be such as ( name@examble.com )',
                          //         );
                          //       } else if (e.code == 'wrong-password') {
                          //         showSnackBar(
                          //           context,
                          //           'Wrong password provided for that user.',
                          //         );
                          //       }
                          //     }
                          //   }
                          // },
                          )
                      : const CircularProgressIndicator(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 36,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Text(
                  //       'Or sign in With',
                  //       style: TextStyle(
                  //         fontSize: 13.sp,
                  //         color: blueColor,
                  //         fontWeight: FontWeight.w400,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 36,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     GestureDetector(
                  //       onTap: () {},
                  //       child: Container(
                  //         height: 7.h,
                  //         width: 15.w,
                  //         decoration: BoxDecoration(
                  //           color: whitColor,
                  //           borderRadius: BorderRadius.circular(15),
                  //           boxShadow: const [
                  //             BoxShadow(
                  //               color: Colors.black45,
                  //               blurRadius: 5,
                  //               offset: Offset(0.5, 0.5),
                  //             ),
                  //           ],
                  //         ),
                  //         child: Icon(
                  //           Icons.facebook,
                  //           size: 35.sp,
                  //           color: Colors.blue,
                  //         ),
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: MediaQuery.of(context).size.width / 8,
                  //     ),
                  //     GestureDetector(
                  //       onTap: () {},
                  //       child: Container(
                  //         height: 7.h,
                  //         width: 15.w,
                  //         decoration: BoxDecoration(
                  //           color: whitColor,
                  //           borderRadius: BorderRadius.circular(15),
                  //           boxShadow: const [
                  //             BoxShadow(
                  //               color: Colors.black45,
                  //               blurRadius: 5,
                  //               offset: Offset(0.5, 0.5),
                  //             ),
                  //           ],
                  //         ),
                  //         child: Padding(
                  //           padding: const EdgeInsets.all(5.0),
                  //           child: Image.asset(
                  //             'assets/images/google_logo.png',
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 23,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have account ? ',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: blueColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen(),));
                        },
                        child: Text(
                          ' Sing Up',
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

  // Future<void> loginUser() async {
  //   UserCredential user = await FirebaseAuth.instance
  //       .signInWithEmailAndPassword(email: email!, password: pass!);
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
