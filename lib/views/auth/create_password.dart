import 'package:flutter/material.dart';
import 'package:y_perz/common/app_theme.dart';
import 'package:y_perz/common/common_widgets.dart';
import 'package:y_perz/extensions/util_extensions.dart';
import 'package:y_perz/helper/helper_class.dart';
import 'package:y_perz/views/home/home_screen.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({Key? key}) : super(key: key);

  @override
  _CreatePasswordScreenState createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
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
                "Create new password",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              25.verticalSpace(),
              Padding(
                padding: 50.paddingHorizontal(),
                child: const Text(
                  "Your new password must be different from the last used password",
                  textAlign: TextAlign.center,
                  style: TextStyle(

                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              40.verticalSpace(),
              Padding(
                padding: 80.paddingHorizontal(),
                child: Column(
                  children: [
                    TextField(
                      controller: _passwordController,
                      style: const TextStyle(
                        color: AppTheme.accentColor,
                      ),
                      decoration: InputDecoration(
                        hintText: "Password",
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
                      controller: _confirmPasswordController,
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
                    60.verticalSpace(),

                    myButton(
                      onTap: () {
                        const HomeScreen().navigate();
                        },
                      context: context,
                      text: "Create",
                    ),
                    20.verticalSpace(),
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
