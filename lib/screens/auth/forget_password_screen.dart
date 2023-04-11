import 'package:e_commerce_firebase_getw/controllers/auth_controller.dart';
import 'package:e_commerce_firebase_getw/utils/theme.dart';
import 'package:e_commerce_firebase_getw/utils/validation_regex.dart';
import 'package:e_commerce_firebase_getw/widgets/auth/auth_button.dart';
import 'package:e_commerce_firebase_getw/widgets/auth/auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  final _controller = Get.find<AuthController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        elevation: 0,
        title: Text(
          'Forget Password',
          style: TextStyle(
            color: Get.isDarkMode ? Colors.black : Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Get.isDarkMode ? Colors.black : Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'If you have forgotten your password, please enter your email address below. You will receive a link to reset your password.',
                ),
                SizedBox(
                  height: 20,
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
                AuthButton(
                  title: 'Send',
                  onPressed: () {
                    _formKey.currentState!.validate();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
