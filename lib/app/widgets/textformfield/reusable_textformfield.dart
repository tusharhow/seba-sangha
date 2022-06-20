import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../controllers/auth_controller.dart';


class ReusableTextFormField extends StatelessWidget {
  ReusableTextFormField({
    Key? key,
    required this.labelText,
    required this.controller,
    required this.hintText,
    @required this.obscureText,
    @required this.obscureIcon,
  }) : super(key: key);
  final String labelText;
  final TextEditingController controller;
  final String hintText;
  bool? obscureText;
  bool? obscureIcon;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (cont) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
        ),
        child: TextFormField(
          controller: controller,
          obscureText: cont.obscureText,
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Colors.white38,
            ),
            labelStyle: const TextStyle(
              color: Colors.white,
            ),
            filled: true,
            fillColor: bgColor2,
            suffixIcon: obscureIcon == true
                ? cont.isVisible
                    ? IconButton(
                        icon: const Icon(
                          Icons.visibility,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          cont.toggleVisibility();
                        },
                      )
                    : IconButton(
                        icon: const Icon(
                          Icons.visibility_off,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          cont.toggleVisibility();
                        },
                      )
                : null,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
          ),
          style: const TextStyle(
            color: Colors.white,
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      );
    });
  }
}
