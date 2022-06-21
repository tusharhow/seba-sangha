import 'package:flutter/material.dart';

class AboutUsAlert extends StatelessWidget {
  const AboutUsAlert({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('About Us'),
      content: SizedBox(
        height: MediaQuery.of(context).size.height / 3.5,
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/logo/logo.png',
                  width: MediaQuery.of(context).size.width / 4,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'This is a simple app to share your love with Bangladesh.',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'This app is made with ❤️ by ',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: 'Tushar Mahmud',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          child: const Text('Close'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
