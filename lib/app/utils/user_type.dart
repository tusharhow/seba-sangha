import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserType extends StatefulWidget {
  const UserType({Key? key}) : super(key: key);

  @override
  _UserTypeState createState() => _UserTypeState();
}

class _UserTypeState extends State<UserType> {
  int selectedIndex = 0;
  final List<String> _userType = [
    "সাহায্য করবো",
    "সাহায্য নিবো",
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: 2,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              setState(() {
                selectedIndex = index;
                prefs.setString("userType", _userType[index]);
              });
              print(selectedIndex);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: _buildUserType(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUserType(int index) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      height: 70,
      width: 160,
      decoration: BoxDecoration(
        border: Border.all(
          color: selectedIndex == index ? Colors.orangeAccent : Colors.white24,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          _userType[index],
          style: TextStyle(
            color: selectedIndex == index ? Colors.orangeAccent : Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
