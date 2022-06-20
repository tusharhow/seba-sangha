import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import '../../controllers/auth_controller.dart';
import '../../utils/navigate.dart';
import '../../utils/user_type.dart';
import '../../widgets/textformfield/buttons/reusable_primary_button.dart';
import '../../widgets/textformfield/reusable_textformfield.dart';
import 'login_screen.dart';

class RegistrationScreenView extends StatelessWidget {
  const RegistrationScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final authController = Get.put(AuthController());
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Center(
                child: Image.asset(
                  'assets/images/im1.png',
                  width: _size.width / 1.8,
                ),
              ),
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UserType(),
              ],
            ),
            const SizedBox(
              height: kDefaultPadding * 2,
            ),
            Form(
              child: Column(
                children: [
                  ReusableTextFormField(
                    controller: authController.emailController,
                    hintText: 'Enter your email/phone',
                    labelText: 'Email/Phone',
                    obscureIcon: false,
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: kDefaultPadding,
                  ),
                  ReusableTextFormField(
                    controller: authController.passwordController,
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
              btnText: 'Sign Up',
              btnTextColor: Colors.white,
              onPressed: () {
                if (authController.emailController == null ||
                    authController.passwordController == null) {
                  Get.snackbar(
                    'Error',
                    'Please fill all the fields',
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                    snackPosition: SnackPosition.BOTTOM,
                  );
                } else {
                  authController.createAccount();
                }
              },
            ),
            const SizedBox(
              height: kDefaultPadding * 2,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                'Already have an account?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  push(context: context, widget: const LoginScreenView());
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                  ),
                ),
              ),
            ]),
            const SizedBox(
              height: kDefaultPadding,
            ),
          ],
        ),
      ),
    );
  }
}
