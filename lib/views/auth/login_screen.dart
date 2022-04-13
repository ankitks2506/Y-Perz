import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:y_perz/common/app_theme.dart';
import 'package:y_perz/common/common_widgets.dart';
import 'package:y_perz/common/keyboard_visibility.dart';
import 'package:y_perz/extensions/util_extensions.dart';
import 'package:y_perz/helper/helper_class.dart';
import 'package:y_perz/views/auth/forgot_password.dart';
import 'package:y_perz/views/auth/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: KeyboardVisibilityBuilder(
        builder: (context, view, isVisible) {
          return SafeArea(
            child: SingleChildScrollView(
              child: SizedBox(
                height: screenHeight(context),
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight(context) * 0.35,
                      child: Center(
                        child: Image.asset(
                          'assets/images/Logo.png',
                          height: screenHeight(context) * 0.2,
                        ),
                      ),
                    ),
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
                                  editTextField(
                                    _emailController,
                                    false,
                                    "Email",
                                    _passwordVisible,
                                  ),
                                  10.verticalSpace(),
                                  editTextField(
                                    _passwordController,
                                    true,
                                    "Password",
                                    _passwordVisible,
                                    onPressed: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                  ),
                                  10.verticalSpace(),
                                  GestureDetector(
                                    onTap: () {
                                      //clear the text from the text field and then navigate to other screen
                                      _emailController.clear();
                                      _passwordController.clear();
                                      const ForgotPasswordScreen().navigate();
                                    },
                                    child: Row(
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
                                  ),
                                  30.verticalSpace(),
                                  signInButton(),
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
            ),
          );
        },
        child: Container(),
      ),
    );
  }

  signInButton() {
    return myButton(
      context: context,
      text: "Log in",
      onTap: () {
        Pattern patternEmail =
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
        RegExp regexEmail =
            RegExp(patternEmail.toString()); // Regex to check valid email
        Pattern patternPassword =
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
        RegExp regexPassword =
            RegExp(patternPassword.toString()); // Regex to check valid password
        if (_emailController.text.isEmpty) {
          validationDialog('Email field must not be empty', context);
        } else if (_passwordController.text.isEmpty) {
          validationDialog('Password field must not be empty', context);
        } else if (!EmailValidator.validate(
          _emailController.text,
        )) {
          validationDialog('Please enter valid email', context);
        } else if (_passwordController.text.length < 8) {
          validationDialog(
              'Password must be at least 8 characters long', context);
        } else if (!regexPassword
            .hasMatch(_passwordController.text.toString())) {
          validationDialog(
              'Password must be at least 8 characters long', context);
        }
      },
    );
  }
}
