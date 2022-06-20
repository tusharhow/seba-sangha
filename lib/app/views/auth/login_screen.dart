import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import '../../controllers/auth_controller.dart';
import '../../utils/navigate.dart';
import '../../widgets/textformfield/buttons/reusable_primary_button.dart';
import '../../widgets/textformfield/reusable_textformfield.dart';
import 'sign_up_screen.dart';

class LoginScreenView extends StatelessWidget {
  const LoginScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final authController = Get.put(AuthController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Center(
                child: Image.asset(
                  'assets/images/im2.png',
                  width: _size.width / 1.8,
                ),
              ),
            ),
            const SizedBox(
              height: kDefaultPadding * 2,
            ),
            Form(
              child: Column(
                children: [
                  ReusableTextFormField(
                    controller: authController.loginEmailController,
                    hintText: 'Enter your email',
                    labelText: 'Email',
                    obscureIcon: false,
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: kDefaultPadding,
                  ),
                  ReusableTextFormField(
                    controller: authController.loginPasswordController,
                    hintText: 'Enter your password',
                    labelText: 'Password',
                    obscureIcon: true,
                    obscureText: true,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: kDefaultPadding * 3,
            ),
            ReusablePrimaryButton(
              btnColor: Colors.red,
              btnText: 'Login',
              btnTextColor: Colors.white,
              onPressed: () {
                if (authController.loginEmailController == null ||
                    authController.loginPasswordController == null) {
                  Get.snackbar(
                    'Error',
                    'Please enter your email and password',
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                  );
                } else {
                  authController.loginUser();
                }
              },
            ),
            const SizedBox(
              height: kDefaultPadding * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an account?',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    push(
                        context: context,
                        widget: const RegistrationScreenView());
                  },
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
