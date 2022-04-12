import 'package:flutter/material.dart';
import 'package:y_perz/common/app_theme.dart';
import 'package:y_perz/common/common_widgets.dart';
import 'package:y_perz/extensions/util_extensions.dart';
import 'package:y_perz/helper/helper_class.dart';
import 'package:y_perz/views/auth/create_password.dart';
import 'package:y_perz/views/home/home_screen.dart';

class OtpScreen extends StatefulWidget {
  final bool fromSignupScreen;
  const OtpScreen(this.fromSignupScreen, {Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpController = TextEditingController();
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
                      "Verification",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    30.verticalSpace(),
                    const Text(
                      "You will get OTP via SMS",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    20.verticalSpace(),
                    Padding(
                      padding: 80.paddingHorizontal(),
                      child: Column(
                        children: [
                          TextField(
                              controller: _otpController,
                              decoration: InputDecoration(
                              contentPadding: 10.paddingAll(),
                              hintText: "Enter OTP",
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
                          40.verticalSpace(),
                          myButton(
                            context: context,
                            text: "Enter",
                            onTap: () {
                              if(widget.fromSignupScreen == true){
                                const HomeScreen().navigate();
                              } else{
                                const CreatePasswordScreen().navigate();
                              }
                            }
                          ),
                          90.verticalSpace(),
                          const Text(
                            "Re-send OTP",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
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
