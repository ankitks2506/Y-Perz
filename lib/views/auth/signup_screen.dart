import 'package:flutter/material.dart';
import 'package:y_perz/common/app_theme.dart';
import 'package:y_perz/common/common_widgets.dart';
import 'package:y_perz/extensions/util_extensions.dart';
import 'package:y_perz/helper/helper_class.dart';
import 'package:y_perz/views/auth/otp_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          width: screenWidth(context),
          height: screenHeight(context),
          color: AppTheme.primaryGreen,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Let's get started",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              10.verticalSpace(),
              const Text(
                "Create Account",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              20.verticalSpace(),
              Padding(
                padding: 40.paddingHorizontal(),
                child: Column(
                  children: [
                    TextField(
                      style: const TextStyle(
                        color: AppTheme.accentColor,
                      ),
                      decoration: InputDecoration(
                        hintText: "Full Name",
                        contentPadding: 10.paddingAll(),
                        fillColor: Colors.white,
                        hintStyle: const TextStyle(
                          color: Colors.white,
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    10.verticalSpace(),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: 10.paddingAll(),
                        hintText: "Email",
                        hintStyle: const TextStyle(
                          color: Colors.white,
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    10.verticalSpace(),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: 10.paddingAll(),
                        hintText: "Phone",
                        hintStyle: const TextStyle(
                          color: Colors.white,
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    10.verticalSpace(),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: 10.paddingAll(),
                        hintText: "Password",
                        hintStyle: const TextStyle(
                          color: Colors.white,
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    10.verticalSpace(),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: 10.paddingAll(),
                        hintText: "Confirm Password",
                        hintStyle: const TextStyle(
                          color: Colors.white,
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    30.verticalSpace(),

                    myButton(
                      onTap: () {
                        const OtpScreen(true).navigate();
                      },
                      context: context,
                      text: "Create",
                    ),
                    20.verticalSpace(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an Account? ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            "Login here",
                            style: TextStyle(
                              color: Color(0xff2F455C),
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
