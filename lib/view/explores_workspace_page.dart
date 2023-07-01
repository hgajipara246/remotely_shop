import 'package:flutter/material.dart';
import 'package:remotely_shop/model/remotely_model.dart';
import 'package:remotely_shop/model/remotely_model_data.dart';
import 'package:remotely_shop/res/constant/app_images.dart';
import 'package:remotely_shop/res/constant/app_text.dart';

class ExploresWorkspacePage extends StatefulWidget {
  const ExploresWorkspacePage({Key? key}) : super(key: key);

  @override
  State<ExploresWorkspacePage> createState() => _ExploresWorkspacePageState();
}

class _ExploresWorkspacePageState extends State<ExploresWorkspacePage> {
  List textList = [
    "Show all",
    "Developer",
    "Podcast creator",
    "Filmaking",
    "Photography",
  ];

  bool liked = false;
  RemotelyModelExploresWorkspace remotelyModelExploresWorkspace = RemotelyModelExploresWorkspace.fromJson(remotelyDataExploresWorkspace);

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
      appBar: AppBar(
        title: Text(
          'Explores Workspace',
          style: TextStyle(
            color: const Color(0xFF040B14),
            fontSize: width / 15,
            fontFamily: 'Avenir',
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          borderRadius: BorderRadius.circular(height / 30),
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            "assets/icons/arrow-left.png",
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(height / 60),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: "What do you do?",
                    focusColor: const Color(0xFFA6A798),
                    suffixIcon: Padding(
                      padding: EdgeInsets.all(height / 80),
                      child: Image.asset(
                        "assets/icons/setting.png",
                        height: 10,
                      ),
                    ),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xFFC9CEDA)),
                    ),
                    fillColor: const Color(0xFFF6F6F5),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xFFC9CEDA)),
                    ),
                  ),
                ),
                SizedBox(height: height / 25),
                Container(
                  height: height / 4.5,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(width / 15),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        right: -2,
                        bottom: 2,
                        child: Image.asset(
                          "assets/images/Workspaces/home theater.png",
                          height: height / 5,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width / 30, vertical: height / 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'FEATURED WORKSPACE',
                              style: TextStyle(
                                color: const Color(0xFFC1C2B8),
                                fontSize: width / 25,
                                fontFamily: 'Avenir',
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(
                              height: height / 30,
                            ),
                            Text(
                              'Professional Gaming \nAccessories',
                              style: TextStyle(
                                color: const Color(0xFFF4F5F7),
                                fontSize: width / 19,
                                fontFamily: 'Avenir',
                                fontWeight: FontWeight.w900,
                              ),
                              overflow: TextOverflow.visible,
                            ),
                            SizedBox(
                              height: height / 100,
                            ),
                            Row(
                              children: [
                                Text(
                                  'View space',
                                  style: TextStyle(
                                    color: const Color(0xFFCED55B),
                                    fontSize: width / 25,
                                    fontFamily: 'Avenir',
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right_rounded,
                                  color: const Color(0xFFCED55B),
                                  size: width / 18,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height / 40),
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
                      Row(
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
                    ],
                  ),
                ),
                SizedBox(
                  height: height / 16,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: textList.length,
                    itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF4F5F7),
                        borderRadius: BorderRadius.circular(width / 15),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width / 30, vertical: height / 45),
                        child: Center(
                          child: Text(
                            textList[index],
                            style: TextStyle(
                              fontFamily: "Avenir",
                              fontSize: width / 25,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFf000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      width: width / 30,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Checkbox.width / 20, vertical: height / 35),
                  child: Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "What ",
                              style: TextStyle(
                                color: const Color(0xFF040B14),
                                fontSize: width / 22,
                                fontFamily: 'Avenir',
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            TextSpan(
                              text: 'YouTubers',
                              style: TextStyle(
                                color: const Color(0xFFBA5C3D),
                                fontSize: width / 22,
                                fontFamily: 'Avenir',
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            TextSpan(
                              text: ' search for ',
                              style: TextStyle(
                                color: const Color(0xFF040B14),
                                fontSize: width / 22,
                                fontFamily: 'Avenir',
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Row(
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
                    ],
                  ),
                ),
                SizedBox(
                  height: 190,
                  child: ListView.separated(
                    itemCount: remotelyModelExploresWorkspace.exploresWorkspace!.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => Stack(
                      children: [
                        Container(
                          width: 158,
                          height: 190,
                          padding: EdgeInsets.all(height / 80),
                          decoration: ShapeDecoration(
                            color: const Color(0xFFF4F5F7),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Image.asset(
                              "${remotelyModelExploresWorkspace.exploresWorkspace![index].image}",
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 8,
                          child: Container(
                            width: 142,
                            height: 77,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(height / 90),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${remotelyModelExploresWorkspace.exploresWorkspace![index].title}",
                                    style: const TextStyle(
                                      color: Color(0xFF040B14),
                                      fontSize: 16,
                                      fontFamily: 'Avenir',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "${remotelyModelExploresWorkspace.exploresWorkspace![index].price}",
                                    style: const TextStyle(
                                      color: Color(0xFFBA5C3D),
                                      fontSize: 12,
                                      fontFamily: 'Avenir',
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  SizedBox(height: height / 95),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "${remotelyModelExploresWorkspace.exploresWorkspace![index].rate}",
                                        style: const TextStyle(
                                          color: Color(0xFF898A7A),
                                          fontSize: 12,
                                          fontFamily: 'Avenir',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Icon(
                                          Icons.star_outlined,
                                          color: const Color(0xFFF2C94C),
                                          size: height / 50,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 3,
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
                    separatorBuilder: (context, index) => SizedBox(
                      width: width / 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
