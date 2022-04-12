import 'package:flutter/material.dart';
import 'package:y_perz/common/app_theme.dart';
import 'package:y_perz/common/common_widgets.dart';
import 'package:y_perz/extensions/util_extensions.dart';
import 'package:y_perz/helper/helper_class.dart';
import 'package:y_perz/views/auth/otp_screen.dart';
import 'package:y_perz/views/auth/signup_screen.dart';


class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
                height: screenHeight(context) * 0.35,
                child: Center(
                  child: Image.asset(
                    'assets/images/Logo.png',
                    height: screenHeight(context) * 0.2,
                  ),
                )),
            Expanded(
              child: Container(
                width: screenWidth(context),
                color: AppTheme.primaryGreen,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Reset Password",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 33,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    30.verticalSpace(),
                    Padding(
                      padding: 40.paddingHorizontal(),
                      child: const Text(
                        "Enter email address associated with your account & We'll send the verification code to reset your password",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    25.verticalSpace(),
                    Padding(
                      padding: 70.paddingHorizontal(),
                      child: Column(
                        children: [
                          TextField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              hintText: "Enter Email",
                              hintStyle: TextStyle(

                                color: Colors.white
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                          ),



                          40.verticalSpace(),
                          myButton(
                            onTap: () {
                            const OtpScreen(false).navigate();
                          },
                            context: context,
                            text: "Enter",
                          ),
                          50.verticalSpace(),
                          GestureDetector(
                            onTap: () {
                              const SignUpScreen().navigate();
                            },
                            child: const Text(
                              "Re-send OTP",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
