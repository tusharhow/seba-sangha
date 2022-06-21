import 'package:bondhu_charity/app/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../controllers/post_controller.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addPostController = Get.put(PostController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('নতুন সমস্যা যোগ করুন'),
        backgroundColor: bgColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 400.0,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                    ),
                    child: Text(
                      'সমস্যা লিখুন',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: TextFormField(
                      controller: addPostController.titleController,
                      maxLines: 1,
                      maxLength: 30,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white24,
                        hintText: 'বাসা ভাড়া দিতে পারছি না',
                        hintStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                        counterStyle: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                    ),
                    child: Text(
                      'সমস্যার বিস্তারিত লিখুন',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: TextFormField(
                      maxLines: 4,
                      maxLength: 180,
                      controller: addPostController.bodyController,
                      decoration: InputDecoration(
                        hintText:
                            'আর্থিক অভাবে বাসা ভাড়া দিতে পারছি না। কেউ সাহায্য করলে উপকার হবে।',
                        filled: true,
                        counterStyle: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                        fillColor: Colors.white24,
                        hintStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                    ),
                    child: Text(
                      'টাকার পরিমান লিখুন',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: TextFormField(
                      maxLines: 1,
                      controller: addPostController.amountController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white24,
                        hintText: '৪৫০ টাকা',
                        hintStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                    ),
                    child: Text(
                      'সাহায্য নেওয়ার মাধ্যম',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: GetBuilder<PostController>(builder: (cont) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          color: Colors.white24,
                        ),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: cont.selectedMethod,
                          icon: const Padding(
                            padding: EdgeInsets.only(
                              right: 20,
                            ),
                            child: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: Colors.white,
                            ),
                          ),
                          iconSize: 24,
                          elevation: 0,
                          dropdownColor: Colors.white,
                          underline: Container(
                            color: Colors.transparent,
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                          hint: const Padding(
                            padding: EdgeInsets.only(
                              left: 15,
                              top: 13,
                            ),
                            child: Text(
                              'সাহায্য নেওয়ার মাধ্যম',
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          selectedItemBuilder: (context) {
                            return cont.paymentMethods.map((String method) {
                              return Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 15,
                                    ),
                                    child: Image.asset(
                                      cont.paymentMethodImages[
                                          cont.paymentMethods.indexOf(method)],
                                      width: 30,
                                      height: 30,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  DropdownMenuItem<String>(
                                    value: method,
                                    child: Text(
                                      method,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }).toList();
                          },
                          borderRadius: BorderRadius.circular(10),
                          onChanged: (newValue) {
                            cont.dropdownMethod(newValue!);
                          },
                          items: cont.paymentMethods
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Row(
                                children: [
                                  Image(
                                    image: AssetImage(cont.paymentMethodImages
                                            .map((e) => e.toString())
                                            .toList()[
                                        cont.paymentMethods.indexOf(value)]),
                                    height: 30,
                                    width: 30,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    value,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                    ),
                    child: Text(
                      'নাম্বার দিন',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: TextFormField(
                      maxLines: 1,
                      controller: addPostController.paymentMethodController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white24,
                        hintText: '০১৮৬৮৯৮৬৪২০',
                        hintStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20 * 3,
                  ),
                  InkWell(
                    onTap: () {
                      if (addPostController.titleController.text.isEmpty) {
                        Fluttertoast.showToast(
                          msg: 'সমস্যা লিখুন',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      } else if (addPostController
                          .bodyController.text.isEmpty) {
                        Fluttertoast.showToast(
                          msg: 'সমস্যার বিস্তারিত লিখুন',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      } else if (addPostController
                          .amountController.text.isEmpty) {
                        Fluttertoast.showToast(
                          msg: 'টাকার পরিমান লিখুন',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      } else if (addPostController
                          .paymentMethodController.text.isEmpty) {
                        Fluttertoast.showToast(
                          msg: 'সাহায্য নেওয়ার মাধ্যম লিখুন',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      } else {
                        addPostController.createPost();
                      }
                    },
                    child: Center(
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 1.3,
                        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Center(
                          child: Text(
                            "পোস্ট যোগ করুন",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
