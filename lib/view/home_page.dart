// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:remotely_shop/model/remotely_model.dart';
import 'package:remotely_shop/model/remotely_model_data.dart';
import 'package:remotely_shop/res/common/app_button/main_button.dart';
import 'package:remotely_shop/res/constant/app_images.dart';
import 'package:remotely_shop/res/constant/app_text.dart';
import 'package:remotely_shop/view/explores_workspace_page.dart';
import 'package:remotely_shop/view/login_signup_screen/login_screen.dart';
import 'package:remotely_shop/view/profile_page.dart';
import 'package:remotely_shop/view/view_item.dart';
import 'package:remotely_shop/view/your_cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  UserModel? userModel = UserModel();

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

  @override
  void initState() {
    getUser();
    super.initState();
  }

  RemotelyModel? remotelyModel = RemotelyModel.fromJson(remotelyDataWorkSpases);
  RemotelyModelNewArrivals? remotelyModelNewArrivals = RemotelyModelNewArrivals.fromJson(remotelyDataNewArrivals);
  RemotelyModelLaptops? remotelyModelLaptops = RemotelyModelLaptops.fromJson(remotelyDataLaptops);
  RemotelyModelTrendingCollection? remotelyModelTrendingCollection = RemotelyModelTrendingCollection.fromJson(remotelyDataTrendingCollection);

  bool liked = false;

  _pressed() {
    setState(() {
      liked = !liked;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      drawer: Drawer(
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              height / 20,
            ),
          ),
        ),
        child: SafeArea(
          child: BottomSheet(
            enableDrag: true,
            onClosing: () {},
            builder: (context) => ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/profiler.png",
                        height: height / 8.5,
                      ),
                      Expanded(
                        child: Text(
                          "${userModel?.name}",
                          style: TextStyle(
                            fontFamily: "Avenir",
                            fontSize: height / 48,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "${userModel?.email}",
                          style: TextStyle(
                            fontFamily: "Avenir",
                            fontSize: height / 48,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: height / 38,
                      fontFamily: "Avenir",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfilePage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Text(
                    'Cart',
                    style: TextStyle(
                      fontSize: height / 38,
                      fontFamily: "Avenir",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const YourCartsPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Text(
                    'Setting',
                    style: TextStyle(
                      fontSize: height / 38,
                      fontFamily: "Avenir",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(
                  title: Text(
                    'About',
                    style: TextStyle(
                      fontSize: height / 38,
                      fontFamily: "Avenir",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: height / 38,
                      fontFamily: "Avenir",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () {
                    CoolAlert.show(
                        context: context,
                        type: CoolAlertType.warning,
                        title: "Are you sure?",
                        text: "Do you want to Logout",
                        cancelBtnText: "No",
                        cancelBtnTextStyle: TextStyle(
                          fontSize: height / 40,
                          fontFamily: "Avenir",
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                        ),
                        showCancelBtn: true,
                        closeOnConfirmBtnTap: true,
                        confirmBtnText: "Yes",
                        confirmBtnTextStyle: TextStyle(
                          fontSize: height / 40,
                          fontFamily: "Avenir",
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                        confirmBtnColor: const Color(0xFFCED55B),
                        onCancelBtnTap: () {
                          Navigator.pop(context);
                        },
                        onConfirmBtnTap: () async {
                          await firebaseAuth.signOut();
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                            (route) => false,
                          );
                        });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () => _scaffoldKey.currentState!.openDrawer(),
          child: Padding(
            padding: EdgeInsets.all(height / 120),
            child: Image.asset("assets/images/profiler.png", height: height / 50),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(height / 100),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                shape: BoxShape.circle,
              ),
              child: Image.asset(AppImages.search, height: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(height / 100),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                shape: BoxShape.circle,
              ),
              child: Image.asset(AppImages.happyBag, height: 22),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 30, vertical: height / 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppText.popularNow,
                  style: const TextStyle(
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.w900,
                    fontSize: 25,
                    color: Color(0xFF000000),
                  ),
                ),
                SizedBox(
                  height: height / 50,
                ),
                Stack(
                  fit: StackFit.loose,
                  clipBehavior: Clip.hardEdge,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(height / 30),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: height / 30, horizontal: width / 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppText.chairName,
                              style: const TextStyle(
                                fontFamily: "Avenir",
                                fontWeight: FontWeight.w900,
                                fontSize: 23,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                            SizedBox(
                              height: height / 100,
                            ),
                            Row(
                              children: [
                                Text(
                                  AppText.childTextChairName,
                                  style: const TextStyle(
                                    fontFamily: "Avenir",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: Color(0xFFA6A798),
                                  ),
                                ),
                                SizedBox(
                                  width: width / 70,
                                ),
                                const Icon(
                                  Icons.circle,
                                  size: 5,
                                  color: Color(0xFFA6A798),
                                ),
                                SizedBox(
                                  width: width / 70,
                                ),
                                Text(
                                  AppText.rateFourPointEight,
                                  style: const TextStyle(
                                    fontFamily: "Avenir",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                                SizedBox(
                                  width: width / 70,
                                ),
                                const Icon(
                                  Icons.star_purple500_outlined,
                                  size: 12,
                                  color: Color(0xFFF2C94C),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height / 40,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height: height / 17,
                                  width: width / 3.1,
                                  child: MainButton(
                                    backgroundColor: const Color(0xFFCED55B),
                                    textName: AppText.viewItem,
                                    mainOnPress: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const ViewItems(),
                                        ),
                                      );
                                    },
                                    textColor: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  width: width / 23,
                                ),
                                Container(
                                  height: height / 17,
                                  width: width / 8,
                                  decoration: const BoxDecoration(
                                    color: Color(0xB0A6A798),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.shopping_bag_outlined,
                                    color: Color(0xFFA6A798),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: width / 35),
                      child: Align(
                        heightFactor: 0.7,
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          AppImages.chairOne,
                          height: height / 3,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height / 60),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Checkbox.width / 20, vertical: height / 35),
                  child: Row(
                    children: [
                      Text(
                        AppText.workSpace,
                        style: const TextStyle(
                          fontFamily: "Avenir",
                          fontWeight: FontWeight.w900,
                          fontSize: 25,
                          color: Color(0xFF000000),
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ExploresWorkspacePage(),
                              ));
                        },
                        child: Row(
                          children: [
                            Text(
                              AppText.seeMore,
                              style: const TextStyle(
                                fontFamily: "Avenir",
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                color: Color(0xFF8A8B7A),
                              ),
                            ),
                            const Icon(
                              Icons.chevron_right_outlined,
                              color: Color(0xFF8A8B7A),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height / 3.5,
                  child: ListView.separated(
                    itemCount: remotelyModel!.workSpasesData!.length,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                      width: width / 2.5,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF4F5F7),
                        borderRadius: BorderRadius.circular(height / 90),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(height / 65),
                        child: Column(
                          children: [
                            Image.asset(
                              "${remotelyModel!.workSpasesData![index].image}",
                            ),
                            SizedBox(height: height / 40),
                            Flexible(
                              child: Text(
                                "${remotelyModel!.workSpasesData![index].post}",
                                style: const TextStyle(
                                  fontFamily: "Avenir",
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18,
                                  color: Colors.black,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                            ),
                            SizedBox(height: height / 130),
                            Expanded(
                              child: Text(
                                "${remotelyModel!.workSpasesData![index].suggestion}",
                                style: const TextStyle(
                                  color: Color(0xFFA6A798),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  fontFamily: "Avenir",
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) => SizedBox(width: width / 30),
                  ),
                ),
                SizedBox(height: height / 60),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Checkbox.width / 20, vertical: height / 35),
                  child: Row(
                    children: [
                      Text(
                        AppText.newArrivals,
                        style: const TextStyle(
                          fontFamily: "Avenir",
                          fontWeight: FontWeight.w900,
                          fontSize: 25,
                          color: Color(0xFF000000),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        AppText.seeMore,
                        style: const TextStyle(
                          fontFamily: "Avenir",
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: Color(0xFF8A8B7A),
                        ),
                      ),
                      const Icon(
                        Icons.chevron_right_outlined,
                        color: Color(0xFF8A8B7A),
                      ),
                    ],
                  ),
                ),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (contex, index) => SizedBox(
                    height: height / 60,
                  ),
                  itemCount: remotelyModelNewArrivals!.newArrivalsData!.length,
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                      color: const Color(0x0fffffff),
                      borderRadius: BorderRadius.circular(height / 100),
                      border: Border.all(
                        color: const Color(0xFFDDDDDB),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: height / 80, horizontal: width / 35),
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: width / 35, vertical: height / 80),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF4F5F7),
                                      borderRadius: BorderRadius.circular(height / 100),
                                    ),
                                    width: width / 3.3,
                                    child: Image.asset(
                                      "${remotelyModelNewArrivals!.newArrivalsData![index].image}",
                                      height: height / 8,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 60, top: 8),
                                    height: height / 20,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: IconButton(
                                      icon: Image.asset(
                                        liked ? AppImages.darkLike : AppImages.lightLike,
                                        // height: height / 40,
                                      ),
                                      onPressed: () => _pressed(),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: width / 40),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${remotelyModelNewArrivals!.newArrivalsData![index].title}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: width / 22,
                                        color: const Color(0xFF040B14),
                                        fontFamily: "Avenir",
                                        overflow: TextOverflow.visible,
                                      ),
                                    ),
                                    SizedBox(height: height / 180),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${remotelyModelNewArrivals!.newArrivalsData![index].subTitle}",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            color: Color(0xFFA6A798),
                                            fontFamily: "Avenir",
                                            overflow: TextOverflow.visible,
                                          ),
                                        ),
                                        SizedBox(width: width / 75),
                                        Icon(
                                          Icons.circle,
                                          color: const Color(0xFFA6A798),
                                          size: height / 110,
                                        ),
                                        SizedBox(width: width / 75),
                                        Text(
                                          "${remotelyModelNewArrivals!.newArrivalsData![index].rate}",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            color: Color(0xFFA6A798),
                                            fontFamily: "Avenir",
                                            overflow: TextOverflow.visible,
                                          ),
                                        ),
                                        SizedBox(width: width / 75),
                                        Icon(
                                          Icons.star_outlined,
                                          color: const Color(0xFFF2C94C),
                                          size: height / 50,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: height / 30,
                                    ),
                                    Text(
                                      "${remotelyModelNewArrivals!.newArrivalsData![index].price}",
                                      style: const TextStyle(
                                        fontFamily: "Avenir",
                                        color: Color(0xFFBA5C3D),
                                        fontWeight: FontWeight.w800,
                                        fontSize: 25,
                                        overflow: TextOverflow.visible,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height / 60),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Checkbox.width / 20, vertical: height / 35),
                  child: Row(
                    children: [
                      Text(
                        AppText.laptops,
                        style: const TextStyle(
                          fontFamily: "Avenir",
                          fontWeight: FontWeight.w900,
                          fontSize: 25,
                          color: Color(0xFF000000),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        AppText.seeMore,
                        style: const TextStyle(
                          fontFamily: "Avenir",
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: Color(0xFF8A8B7A),
                        ),
                      ),
                      const Icon(
                        Icons.chevron_right_outlined,
                        color: Color(0xFF8A8B7A),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height / 3.0,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => SizedBox(width: width / 30),
                    itemCount: remotelyModelLaptops!.laptopsData!.length,
                    itemBuilder: (context, index) => Stack(
                      children: [
                        Container(
                          width: width / 2,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF4F5F7),
                            borderRadius: BorderRadius.circular(height / 90),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(height / 65),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "${remotelyModelLaptops!.laptopsData![index].image}",
                                  height: height / 7,
                                ),
                                SizedBox(height: height / 80),
                                Text(
                                  "${remotelyModelLaptops!.laptopsData![index].title}",
                                  style: const TextStyle(
                                    fontFamily: "Avenir",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                    color: Colors.black,
                                    overflow: TextOverflow.visible,
                                  ),
                                ),
                                SizedBox(height: height / 130),
                                Text(
                                  "${remotelyModelLaptops!.laptopsData![index].price}",
                                  style: const TextStyle(
                                    color: Color(0xFFBA5C3D),
                                    fontWeight: FontWeight.w800,
                                    fontSize: 15,
                                    fontFamily: "Avenir",
                                    overflow: TextOverflow.visible,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${remotelyModelLaptops!.laptopsData![index].rate}",
                                      style: TextStyle(
                                        fontSize: height / 45,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Avenir",
                                        color: const Color(0xFF8A8B7A),
                                        overflow: TextOverflow.visible,
                                      ),
                                    ),
                                    SizedBox(
                                      width: width / 80,
                                    ),
                                    Icon(
                                      Icons.star_purple500_outlined,
                                      size: height / 45,
                                      color: const Color(0xFFF2C94C),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: Container(
                            margin: const EdgeInsets.only(left: 60, top: 8),
                            height: height / 20,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: IconButton(
                              icon: Image.asset(
                                liked ? AppImages.darkLike : AppImages.lightLike,
                                // height: height / 40,
                              ),
                              onPressed: () => _pressed(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height / 60),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Checkbox.width / 20, vertical: height / 35),
                  child: Row(
                    children: [
                      Text(
                        AppText.collection,
                        style: const TextStyle(
                          fontFamily: "Avenir",
                          fontWeight: FontWeight.w900,
                          fontSize: 25,
                          color: Color(0xFF000000),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        AppText.seeMore,
                        style: const TextStyle(
                          fontFamily: "Avenir",
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: Color(0xFF8A8B7A),
                        ),
                      ),
                      const Icon(
                        Icons.chevron_right_outlined,
                        color: Color(0xFF8A8B7A),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height / 2.7,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => SizedBox(width: width / 30),
                    itemCount: remotelyModelTrendingCollection!.trendingCollections!.length,
                    itemBuilder: (context, index) => Container(
                      width: width / 2,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF4F5F7),
                        borderRadius: BorderRadius.circular(height / 80),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: height / 60, horizontal: width / 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFFFFF),
                                borderRadius: BorderRadius.circular(height / 80),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  "${remotelyModelTrendingCollection!.trendingCollections![index].image}",
                                ),
                              ),
                            ),
                            SizedBox(height: height / 50),
                            Text(
                              "${remotelyModelTrendingCollection!.trendingCollections![index].title}",
                              style: TextStyle(
                                color: const Color(0xFF040B14),
                                fontWeight: FontWeight.w800,
                                fontSize: height / 35,
                                fontFamily: "Avenir",
                                height: height / 700,
                                overflow: TextOverflow.visible,
                              ),
                            ),
                            SizedBox(height: height / 150),
                            Text(
                              "See collection",
                              style: TextStyle(
                                color: const Color(0xFFBA5C3D),
                                fontWeight: FontWeight.w800,
                                fontSize: height / 40,
                                fontFamily: "Avenir",
                                overflow: TextOverflow.visible,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        foregroundColor: Colors.white,
        focusColor: Colors.white,
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const YourCartsPage(),
            ),
          );
        },
        child: Image.asset(
          AppImages.shoppingCart,
          height: height / 32,
        ),
      ),
    );
  }
}

class HomeSreens extends StatefulWidget {
  const HomeSreens({super.key});

  @override
  State<HomeSreens> createState() => _HomeSreensState();
}

class _HomeSreensState extends State<HomeSreens> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/profiler.png",
              height: height / 8.5,
            ),
          ],
        ),
      ),
    );
  }
}
