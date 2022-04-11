import 'package:flutter/material.dart';
import 'package:y_perz/common/app_theme.dart';
import 'package:y_perz/common/common_widgets.dart';
import 'package:y_perz/extensions/util_extensions.dart';
import 'package:y_perz/helper/helper_class.dart';
import 'package:y_perz/views/auth/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                      "User Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    10.verticalSpace(),
                    const Text(
                      "Welcome Back",
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
                            decoration: InputDecoration(
                              contentPadding: 10.paddingAll(),
                              hintText: "Email address",
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  color: AppTheme.accentColor,
                                ),
                              ),
                            ],
                          ),
                          30.verticalSpace(),
                          myButton(
                            context: context,
                            text: "Login",
                            onTap: () {},
                          ),
                          20.verticalSpace(),
                          GestureDetector(
                            onTap: () {
                              const SignUpScreen().navigate();
                            },
                            child: const Text(
                              "Create Account",
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
