// ignore_for_file: unnecessary_null_comparison, use_build_context_synchronously, deprecated_member_use

import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:remotely_shop/model/remotely_model.dart';
import 'package:remotely_shop/utils/utils.dart';
import 'package:remotely_shop/view/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  UserModel userModel = UserModel();
  Utils utils = Utils();

  getUser() {
    CollectionReference users = firebaseFirestore.collection("user");
    users.doc(firebaseAuth.currentUser!.uid).get().then((value) {
      debugPrint("User Added successfully  --------> ${jsonEncode(value.data())}");
      userModel = userModelFromJson(jsonEncode(value.data()));
      setState(() {});
    }).catchError((error) {
      debugPrint("Failed to get user  : $error");
    });
  }

  File? imgFile;
  String? imgPath;

  Future<void> getImgFromGallery() async {
    final pickedImage = await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      await saveData(pickedImage.path.toString()); // Wait for the data to be saved
      setState(() {
        imgFile = File(pickedImage.path);
      });
    } else {
      debugPrint("No image selected------->");
    }
  }

  Future<void> pickImageFromCamera() async {
    final pickedImage = await ImagePicker().getImage(source: ImageSource.camera);
    if (pickedImage != null) {
      await saveData(pickedImage.path.toString()); // Wait for the data to be saved
      setState(() {
        imgFile = File(pickedImage.path);
      });
    } else {
      debugPrint("No image selected------->");
    }
  }

  Future<void> saveData(String val) async {
    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.setString('path', val); // Wait for the data to be saved
    getData();
  }

  Future<void> getData() async {
    final sharedPref = await SharedPreferences.getInstance();
    final imagePath = sharedPref.getString('path'); // Retrieve the stored value using the correct key
    setState(() {
      imgPath = imagePath;
    });
  }

  Future<void> saveImageToGallery() async {
    if (imgFile != null || imgPath != null) {
      final directory = await getTemporaryDirectory();
      final imagePath = '${directory.path}/profile_image.jpg';
      if (imgFile != null) {
        await imgFile!.copy(imagePath);
      } else if (imgPath != null) {
        final originalFile = File(imgPath!);
        await originalFile.copy(imagePath);
      }

      try {
        await GallerySaver.saveImage(imagePath);
        debugPrint('Image saved successfully to the gallery.');
      } catch (e) {
        debugPrint('Failed to save the image to the gallery: $e');
      }
    } else {
      debugPrint('No image file available. Please select or capture an image.');
    }
  }

  Future<void> downloadImage() async {
    if (imgPath != null) {
      final appDir = await getExternalStorageDirectory();
      final String localPath = '${appDir!.path}/downloaded_image.jpg';

      final File originalFile = File(imgPath!);
      final File downloadedFile = await originalFile.copy(localPath);

      try {
        await GallerySaver.saveImage(downloadedFile.path);
        utils.showSnackBar(context, message: "Image downloaded successfully. Check Your Gallery");
        debugPrint("Image downloaded successfully. Check Your Gallery");
      } catch (e) {
        utils.showSnackBar(context, message: 'Failed to save the image to the gallery: $e');

        debugPrint('Failed to save the image to the gallery: $e');
      }
    } else {
      utils.showSnackBar(context, message: 'No image path available.');

      debugPrint('No image path available.');
    }
  }

  @override
  void initState() {
    getUser();
    getData();

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
        actions: [
          IconButton(
            icon: const Icon(
              Icons.download,
              color: Colors.black,
            ),
            onPressed: () {
              downloadImage();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(height / 30),
          child: Column(
            children: [
              ClipOval(
                child: imgPath != null
                    ? InkWell(
                        onTap: () => showModalBottomSheet(
                          isDismissible: true,
                          context: context,
                          backgroundColor: Colors.transparent,
                          // barrierColor: Colors.transparent,
                          builder: (context) => Container(
                            height: 150,
                            width: double.infinity,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                )),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Select option",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.white),
                                          shape: BoxShape.circle,
                                        ),
                                        child: IconButton(
                                          onPressed: () {
                                            pickImageFromCamera();
                                            Navigator.of(context).pop();
                                          },
                                          icon: const Icon(
                                            Icons.camera_alt_rounded,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.white),
                                          shape: BoxShape.circle,
                                        ),
                                        child: IconButton(
                                          onPressed: () {
                                            // pickImageFromGallery();
                                            getImgFromGallery();
                                            Navigator.of(context).pop();
                                          },
                                          icon: const Padding(
                                            padding: EdgeInsets.all(4.0),
                                            child: Icon(
                                              Icons.image,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            if (imgPath != null)
                              Image.file(
                                File(imgPath!),
                                height: height / 6,
                                width: width / 2.8,
                                fit: BoxFit.cover,
                              ),
                          ],
                        ),
                      )
                    : InkWell(
                        onTap: () => showModalBottomSheet(
                          isDismissible: true,
                          context: context,
                          backgroundColor: Colors.transparent,
                          // barrierColor: Colors.transparent,
                          builder: (context) => Container(
                            height: 150,
                            width: double.infinity,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                )),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Select option",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.white),
                                          shape: BoxShape.circle,
                                        ),
                                        child: IconButton(
                                          onPressed: () {
                                            pickImageFromCamera();
                                            Navigator.of(context).pop();
                                          },
                                          icon: const Icon(
                                            Icons.camera_alt_rounded,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.white),
                                          shape: BoxShape.circle,
                                        ),
                                        child: IconButton(
                                          onPressed: () {
                                            // pickImageFromGallery();
                                            getImgFromGallery();
                                            Navigator.of(context).pop();
                                          },
                                          icon: const Padding(
                                            padding: EdgeInsets.all(4.0),
                                            child: Icon(
                                              Icons.image,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        child: Image.asset(
                          "assets/images/profiler.png",
                          height: height / 6,
                          width: width / 2.8,
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: height / 50),
                child: InkWell(
                  overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                  onTap: () => showModalBottomSheet(
                    isDismissible: true,
                    context: context,
                    backgroundColor: Colors.transparent,
                    // barrierColor: Colors.transparent,
                    builder: (context) => Container(
                      height: 150,
                      width: double.infinity,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Select option",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    shape: BoxShape.circle,
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      // pickImageFromCamera();
                                      pickImageFromCamera();
                                      Navigator.of(context).pop();
                                    },
                                    icon: const Icon(
                                      Icons.camera_alt_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    shape: BoxShape.circle,
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      // pickImageFromGallery();
                                      getImgFromGallery();
                                      Navigator.of(context).pop();
                                    },
                                    icon: const Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Icon(
                                        Icons.image,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
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
                    overflow: TextOverflow.visible,
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
                    overflow: TextOverflow.visible,
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
                      fontSize: width / 25,
                    ),
                    overflow: TextOverflow.visible,
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
