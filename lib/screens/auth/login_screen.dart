import 'package:e_commerce_firebase_getw/controllers/auth_controller.dart';
import 'package:e_commerce_firebase_getw/utils/theme.dart';
import 'package:e_commerce_firebase_getw/utils/validation_regex.dart';
import 'package:e_commerce_firebase_getw/widgets/auth/auth_bottom_navigation_bar.dart';
import 'package:e_commerce_firebase_getw/widgets/auth/auth_button.dart';
import 'package:e_commerce_firebase_getw/widgets/auth/auth_text_field.dart';
import 'package:e_commerce_firebase_getw/widgets/auth/check_box_widget.dart';
import 'package:e_commerce_firebase_getw/widgets/auth/social_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _controller = Get.find<AuthController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      bottomNavigationBar: AuthButtomNavigationBar(
        text: 'Don\'t have an account? ',
        underLineText: 'Create one',
        onPressed: () {
          Get.offNamed('/signup');
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    text: 'Log ',
                    style: TextStyle(
                      color: mainColor,
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: 'IN',
                        style: TextStyle(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                AuthTextField(
                  hintText: 'Email',
                  controller: _emailController,
                  validation: (value) {
                    if (value.isEmpty ||
                        value.toString().length <= 2 ||
                        !RegExp(ValidationRegex.email).hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  prefixIcon: Image.asset('assets/images/email.png'),
                ),
                SizedBox(
                  height: 20,
                ),
                GetBuilder<AuthController>(builder: (context) {
                  return AuthTextField(
                    hintText: 'Password',
                    controller: _passwordController,
                    obscureText: !_controller.isPasswordVisible,
                    validation: (value) {
                      if (value.isEmpty || value.toString().length <= 5) {
                        return 'Please choose a valid password';
                      }
                      return null;
                    },
                    prefixIcon: Image.asset('assets/images/lock.png'),
                    suffixIcon: IconButton(
                      onPressed: () => _controller.togglePasswordVisibility(),
                      icon: Icon(
                        _controller.isPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey,
                      ),
                    ),
                  );
                }),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed('/forget-password');
                    },
                    child: Text(
                      'Forget your password ?',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CheckBoxWidget(
                  title: Text.rich(
                    TextSpan(
                      text: 'Remember me',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GetBuilder<AuthController>(builder: (context) {
                  return AuthButton(
                    title: 'LOG IN',
                    isLoading: _controller.isLoading,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await _controller.logInWithEmailAndPasswod(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                      }
                    },
                  );
                }),
                SocialAuth(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
