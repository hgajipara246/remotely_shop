import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:remotely_shop/model/remotely_model.dart';
import 'package:remotely_shop/res/constant/app_images.dart';
import 'package:remotely_shop/utils/utils.dart';
import 'package:remotely_shop/view/home_page.dart';

class ProfilePage extends StatefulWidget {
  final File? image;
  const ProfilePage({Key? key, this.image}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  final storageRef = FirebaseStorage.instance.ref();

  UserModel userModel = UserModel();
  Utils utils = Utils();

  final ImagePicker picker = ImagePicker();
  XFile? image;
  File? imageFile;

  getUser() {
    CollectionReference users = firebaseFirestore.collection("user");
    users.doc(firebaseAuth.currentUser!.uid).get().then((value) {
      debugPrint("User Added successfully  --------> ${jsonEncode(value.data())}");
      userModel = userModelFromJson(jsonEncode(value.data()));
    }).catchError((error) {
      debugPrint("Faild to get user  : $error");
    });
    setState(() {});
  }

  pickImage() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    imageFile = File(image!.path);
    storeImage();
    setState(() {});
  }

  storeImage() async {
    try {
      UploadTask uploadTask = firebaseStorage.ref().child("image").child("profile_1.jpg").putFile(imageFile!);

      uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) {
        switch (taskSnapshot.state) {
          case TaskState.running:
            final progress = 100.0 * (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
            debugPrint("upload is $progress% complete.");
            break;
          case TaskState.paused:
            debugPrint("upload  is paused");
            break;
          case TaskState.success:
            debugPrint("upload was success");
            break;
          case TaskState.canceled:
            debugPrint("upload was canceled");
            break;
          case TaskState.error:
            debugPrint("upload was error");
            break;
        }
      });
    } on FirebaseException catch (e) {
      utils.showSnackBar(context, message: e.message);
    }
  }

  downloadImage() async {
    final islandRef = storageRef.child("images/island.jpg");
    final gsReference = FirebaseStorage.instance.refFromURL("gs://YOUR_BUCKET/images/stars.jpg");

    final httpsReference = FirebaseStorage.instance.refFromURL("gs: //remotely-application.appspot.com/image/profile_1.jpg");

    final appDocDir = await getApplicationDocumentsDirectory();
    final filePath = "${appDocDir.absolute}/images/island.jpg";
    final file = File(filePath);

    final downloadTask = islandRef.writeToFile(file);
    downloadTask.snapshotEvents.listen((taskSnapshot) {
      switch (taskSnapshot.state) {
        case TaskState.running:
          // TODO: Handle this case.
          break;
        case TaskState.paused:
          // TODO: Handle this case.
          break;
        case TaskState.success:
          // TODO: Handle this case.
          break;
        case TaskState.canceled:
          // TODO: Handle this case.
          break;
        case TaskState.error:
          // TODO: Handle this case.
          break;
      }
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
          child: userModel == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    ClipOval(
                      child: imageFile != null
                          ? Image.file(
                              imageFile!,
                              height: height / 6,
                              width: width / 2.8,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              AppImages.profile,
                              height: height / 6,
                              width: width / 2.8,
                              fit: BoxFit.cover,
                            ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: height / 50),
                      child: InkWell(
                        overlayColor: MaterialStatePropertyAll(Colors.transparent),
                        onTap: () {
                          pickImage();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Edit Image",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: "Avenir",
                                fontSize: width / 20,
                              ),
                            ),
                            SizedBox(width: width / 50),
                            Icon(
                              Icons.edit,
                              size: height / 35,
                            ),
                          ],
                        ),
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
                          "${userModel.name}",
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
                          "${userModel.number}",
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
                          "${userModel.email}",
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
                          "${userModel.id}",
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
