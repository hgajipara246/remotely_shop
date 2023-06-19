import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:remotely_shop/model/remotely_model.dart';
import 'package:remotely_shop/res/constant/app_images.dart';
import 'package:remotely_shop/view/home_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  UserModel? userModel = UserModel();

  getUser() {
    CollectionReference users = firebaseFirestore.collection("user");
    users.doc(firebaseAuth.currentUser!.uid).get().then((value) {
      debugPrint("User Added successfully  --------> ${jsonEncode(value.data())}");
      userModel = userModelFromJson(jsonEncode(value.data()));
    }).catchError((error) {
      debugPrint("Faild to get user  : $error");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          borderRadius: BorderRadius.circular(height / 30),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          },
          child: Image.asset(
            "assets/icons/arrow-left.png",
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(height / 30),
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  AppImages.profile,
                ),
              ),
              SizedBox(height: height / 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Name : ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: height / 40,
                      fontFamily: "Avenir",
                    ),
                  ),
                  Text(
                    "${userModel!.name}",
                    style: TextStyle(
                      fontFamily: "Avenir",
                      fontSize: height / 48,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height / 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Number : ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: height / 40,
                      fontFamily: "Avenir",
                    ),
                  ),
                  Text(
                    "${userModel!.number}",
                    style: TextStyle(
                      fontFamily: "Avenir",
                      fontSize: height / 48,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height / 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Email : ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: height / 40,
                      fontFamily: "Avenir",
                    ),
                  ),
                  Text(
                    "${userModel!.email}",
                    style: TextStyle(
                      fontFamily: "Avenir",
                      fontSize: height / 48,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height / 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Id : ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: height / 40,
                      fontFamily: "Avenir",
                    ),
                  ),
                  Text(
                    "${userModel!.id}",
                    style: TextStyle(
                      fontFamily: "Avenir",
                      fontSize: height / 48,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
