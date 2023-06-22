// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
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
  final String imageReferencePath = 'images/profile.jpg'; // Replace with the reference path of your image in Firebase Storage
  String dataUrl = 'https://images.unsplash.com/photo-1582911131929-b5fa50720002?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80';

  UserModel userModel = UserModel();
  Utils utils = Utils();

  final ImagePicker picker = ImagePicker();
  XFile? image;
  File? cameraImage;

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
        actions: [
          IconButton(
            icon: const Icon(
              Icons.download,
              color: Colors.pink,
            ),
            onPressed: () async {
              await saveImage(context);
            },
          ),
        ],
      ),
      body: userModel == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(height / 30),
                child: Column(
                  children: [
                    ClipOval(
                      child: cameraImage != null
                          ? Image.file(
                              cameraImage!,
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
                                color: Colors.black26,
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
                                            pickImageFromGallery();
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

  storeImage() async {
    try {
      final UploadTask uploadTask = firebaseStorage.ref().child("images").child("profile.png").putFile(cameraImage!);
// Listen for state changes, errors, and completion of the upload.
      uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) {
        switch (taskSnapshot.state) {
          case TaskState.running:
            final progress = 100.0 * (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
            debugPrint("Upload is $progress% complete.");
            break;
          case TaskState.paused:
            debugPrint("Upload is paused.");
            break;
          case TaskState.canceled:
            debugPrint("Upload was canceled");
            break;
          case TaskState.error:
            debugPrint("Upload was error");
            // Handle unsuccessful uploads
            break;
          case TaskState.success:
            debugPrint("Upload was success");
            // Handle successful uploads on complete
            // ...
            break;
        }
      });
    } on FirebaseException catch (e) {
      utils.showSnackBar(context, message: e.message);
    }
  }

  pickImageFromCamera() async {
    image = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (image != null) {
        cameraImage = File(image!.path);
        storeImage();
      } else {
        debugPrint("No image selected------->");
      }
    });
  }

  pickImageFromGallery() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        cameraImage = File(image!.path);
        storeImage();
      } else {
        debugPrint("No image selected");
      }
    });
  }

  uploadFromString() async {
    try {
      await firebaseStorage.ref().child("images").child("url_image").putString(
            dataUrl,
            format: PutStringFormat.dataUrl,
          );
    } on FirebaseException catch (e) {
      utils.showSnackBar(context, message: e.message);
    }
  }

  // Future<void> saveImage(BuildContext context) async {
  //   String? message;
  //   final scaffoldMessenger = ScaffoldMessenger.of(context);
  //
  //   try {
  //     // Download image
  //     final http.Response response = await http.get(Uri.parse(dataUrl));
  //
  //     // Get temporary directory
  //     final dir = await getTemporaryDirectory();
  //
  //     // Create an image name
  //     var filename = '${dir.path}/images.png';
  //
  //     // Save to filesystem
  //     final file = File(filename);
  //     await file.writeAsBytes(response.bodyBytes);
  //
  //     // Ask the user to save it
  //     final params = SaveFileDialogParams(sourceFilePath: file.path);
  //     final finalPath = await FlutterFileDialog.saveFile(params: params);
  //
  //     if (finalPath != null) {
  //       message = 'Image saved to disk';
  //     }
  //   } catch (e) {
  //     message = 'An error occurred while saving the image';
  //   }
  //
  //   if (message != null) {
  //     scaffoldMessenger.showSnackBar(SnackBar(content: Text(message)));
  //   }
  // }

  Future<void> saveImage(BuildContext context) async {
    String? message;
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    try {
      // Reference to the image in Firebase Storage
      final ref = FirebaseStorage.instance.ref().child('images/profile.jpg'); // Replace with the reference path of your image in Firebase Storage

      // Get temporary directory
      final dir = await getTemporaryDirectory();

      // Create a file
      final file = File('${dir.path}/image.jpg');

      // Download and save the image
      await ref.writeToFile(file);

      // Show success message
      message = 'Image saved to disk';
    } catch (e) {
      // Handle the StorageException
      debugPrint('StorageException: $e');
    }

    if (message != null) {
      scaffoldMessenger.showSnackBar(SnackBar(content: Text(message)));
    }
  }
}
