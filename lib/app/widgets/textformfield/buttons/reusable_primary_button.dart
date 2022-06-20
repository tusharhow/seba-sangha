import 'package:flutter/material.dart';

class ReusablePrimaryButton extends StatelessWidget {
  const ReusablePrimaryButton({
    Key? key,
    @required this.btnColor,
    @required this.btnText,
    @required this.btnTextColor,
    required this.onPressed,
  }) : super(key: key);
  final btnColor;
  final btnText;
  final btnTextColor;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed as VoidCallback,
      child: Container(
        height: 55,
        width: MediaQuery.of(context).size.width / 1.2,
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            btnText,
            style: TextStyle(
              color: btnTextColor,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
