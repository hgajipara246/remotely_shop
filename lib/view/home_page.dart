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
  RemotelyModel? remotelyModel = RemotelyModel.fromJson(remotelyDataWorkSpases);
  RemotelyModelNewArrivals? remotelyModelNewArrivals = RemotelyModelNewArrivals.fromJson(remotelyDataNewArrivals);

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.all(height / 120),
          child: Image.asset(AppImages.profile, height: height / 50),
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
                                    textName: AppText.viewItem,
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
                            Text(
                              "${remotelyModel!.workSpasesData![index].post}",
                              style: const TextStyle(
                                fontFamily: "Avenir",
                                fontWeight: FontWeight.w800,
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: height / 130),
                            Text(
                              "${remotelyModel!.workSpasesData![index].suggestion}",
                              style: const TextStyle(
                                color: Color(0xFFA6A798),
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                fontFamily: "Avenir",
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
                SizedBox(
                  height: height / 1.2,
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (contex, index) => SizedBox(
                      height: height / 60,
                    ),
                    itemCount: remotelyModelNewArrivals!.newArrivalsData!.length,
                    itemBuilder: (context, index) => Container(
                      width: double.infinity,
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
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Padding(
                                        padding: EdgeInsets.all(height / 70),
                                        child: Container(
                                          height: height / 20,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                          ),
                                          child: Positioned(
                                            right: 0,
                                            child: IconButton(
                                              icon: Image.asset(
                                                liked ? AppImages.darkLike : AppImages.lightLike,
                                                // height: height / 40,
                                              ),
                                              onPressed: () => _pressed(),
                                            ),
                                          ),
                                        ),
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
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 21,
                                          color: Color(0xFF040B14),
                                          fontFamily: "Avenir",
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
                                            ),
                                          ),
                                          SizedBox(width: width / 70),
                                          Icon(
                                            Icons.circle,
                                            color: const Color(0xFFA6A798),
                                            size: height / 100,
                                          ),
                                          SizedBox(width: width / 70),
                                          Text(
                                            "${remotelyModelNewArrivals!.newArrivalsData![index].rate}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              color: Color(0xFFA6A798),
                                              fontFamily: "Avenir",
                                            ),
                                          ),
                                          SizedBox(width: width / 70),
                                          Icon(
                                            Icons.star_outlined,
                                            color: const Color(0xFFF2C94C),
                                            size: height / 45,
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
                ),
                Container(
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
                          "assets/images/products/laptops.png",
                        ),
                        SizedBox(height: height / 40),
                        const Text(
                          "Apple Macbook Pro 16inch",
                          style: TextStyle(
                            fontFamily: "Avenir",
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: height / 130),
                        const Text(
                          "USD 1,799.00",
                          style: TextStyle(
                            color: Color(0xFFA6A798),
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            fontFamily: "Avenir",
                          ),
                        )
                      ],
                    ),
                  ),
                ),
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
