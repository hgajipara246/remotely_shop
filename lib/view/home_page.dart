import 'package:flutter/material.dart';
import 'package:remotely_shop/model/remotely_model.dart';
import 'package:remotely_shop/model/remotely_model_data.dart';
import 'package:remotely_shop/res/common/app_button/main_button.dart';
import 'package:remotely_shop/res/constant/app_images.dart';
import 'package:remotely_shop/res/constant/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RemotelyModel? remotelyModel = RemotelyModel.fromjson(remotelyModelData);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(height / 120),
          child: Image.asset(AppImages.profile, height: height / 50),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: height / 18,
              width: width / 8,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                shape: BoxShape.circle,
              ),
              child: Image.asset(AppImages.search, height: 50),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: height / 18,
              width: width / 8,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                shape: BoxShape.circle,
              ),
              child: Image.asset(AppImages.happyBag, height: 50),
            ),
          ),
        ],
        backgroundColor: Colors.white,
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
                                    textName: "View item",
                                    mainOnPress: () {},
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
                  height: height / 4,
                  child: ListView.separated(
                    itemCount: remotelyModel!.workSpasesData!.length,
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                      width: width / 2.5,
                      decoration: BoxDecoration(
                        color: Color(0xFFF4F5F7),
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
                            Text(
                              "${remotelyModel!.workSpasesData![index].Post}",
                            ),
                            SizedBox(height: height / 130),
                            Text(
                              "${remotelyModel!.workSpasesData![index].suggestion}",
                            )
                          ],
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) => SizedBox(width: width / 30),
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
        onPressed: () {},
        child: Image.asset(
          AppImages.shoppingCart,
          height: height / 32,
        ),
      ),
    );
  }
}
