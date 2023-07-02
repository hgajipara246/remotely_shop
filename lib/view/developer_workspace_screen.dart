import 'package:flutter/material.dart';
import 'package:remotely_shop/model/remotely_model.dart';
import 'package:remotely_shop/model/remotely_model_data.dart';
import 'package:remotely_shop/res/constant/app_images.dart';

class DeveloperWorkspace extends StatefulWidget {
  const DeveloperWorkspace({super.key});

  @override
  State<DeveloperWorkspace> createState() => _DeveloperWorkspaceState();
}

class _DeveloperWorkspaceState extends State<DeveloperWorkspace> {
  RemotelyModelExploresWorkspace remotelyModelExploresWorkspace = RemotelyModelExploresWorkspace.fromJson(remotelyDataExploresWorkspace);

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
      appBar: AppBar(
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
            padding: EdgeInsets.symmetric(vertical: height / 100, horizontal: width / 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Developer Workspace',
                  style: TextStyle(
                    color: const Color(0xFF040B14),
                    fontSize: width / 17,
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  '16 suggested items',
                  style: TextStyle(
                    color: const Color(0xFF898A7A),
                    fontSize: width / 25,
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: height / 40),
                TextField(
                  decoration: InputDecoration(
                    hintText: "What are you looking for?",
                    focusColor: const Color(0xFFA6A798),
                    suffixIcon: Padding(
                      padding: EdgeInsets.all(height / 60),
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
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height / 40),
                  child: Text(
                    'SUGGESTED ITEMS',
                    style: TextStyle(
                      color: const Color(0xFF898A7A),
                      fontSize: width / 25,
                      fontFamily: 'Avenir',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: remotelyModelExploresWorkspace.exploresWorkspace!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 6.0,
                    mainAxisSpacing: 15.0,
                    mainAxisExtent: 190,
                  ),
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
                          height: 80,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
