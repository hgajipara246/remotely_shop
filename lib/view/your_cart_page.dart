import 'package:flutter/material.dart';
import 'package:remotely_shop/model/remotely_model.dart';
import 'package:remotely_shop/model/remotely_model_data.dart';
import 'package:remotely_shop/res/common/app_button/main_button.dart';
import 'package:remotely_shop/res/common/app_button/text_button.dart';
import 'package:remotely_shop/view/home_page.dart';

class YourCartsPage extends StatefulWidget {
  const YourCartsPage({Key? key}) : super(key: key);

  @override
  State<YourCartsPage> createState() => _YourCartsPageState();
}

class _YourCartsPageState extends State<YourCartsPage> {
  int _itemCount = 0;
  RemotelyModelYourCartPage? remotelyModelYourCartPage = RemotelyModelYourCartPage.fromJson(remotelyDataYourCartPage);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 25),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Your Cart",
                      style: TextStyle(
                        fontSize: height / 30,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                        fontFamily: "Avenir",
                        overflow: TextOverflow.visible,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "3 items",
                      style: TextStyle(
                        fontSize: height / 50,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFFA6A798),
                        fontFamily: "Avenir",
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height / 50),
                ListView.separated(
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => SizedBox(
                    height: height / 70,
                  ),
                  itemCount: 3,
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF4F5F7),
                      borderRadius: BorderRadius.circular(height / 120),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(height / 80),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // padding: EdgeInsets.symmetric(vertical: height / 80),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(height / 100),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: height / 40.0),
                              child: Image.asset(
                                "${remotelyModelYourCartPage!.yourCartPage![index].image}",
                                height: height / 10,
                              ),
                            ),
                          ),
                          SizedBox(width: width / 30),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${remotelyModelYourCartPage!.yourCartPage![index].title}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: width / 22,
                                  fontFamily: "Avenir",
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                              SizedBox(height: height / 90),
                              Text(
                                "${remotelyModelYourCartPage!.yourCartPage![index].price}",
                                style: const TextStyle(
                                  color: Color(0xFFBA5C3D),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "Avenir",
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                              SizedBox(height: height / 90),
                              Row(
                                children: [
                                  Container(
                                    height: height / 25,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 0.2,
                                        color: const Color(0xFF8A8B7A),
                                      ),
                                    ),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.remove,
                                        size: height / 45,
                                        color: Colors.grey,
                                      ),
                                      splashRadius: height / 45,
                                      onPressed: () => setState(() => _itemCount > 1 ? _itemCount-- : null),
                                    ),
                                  ),
                                  SizedBox(width: width / 60),
                                  Text(
                                    _itemCount.toString(),
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(width: width / 60),
                                  Container(
                                    height: height / 25,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 0.2,
                                          color: const Color(0xFF8A8B7A),
                                        )),
                                    child: IconButton(
                                        icon: Icon(
                                          Icons.add,
                                          size: height / 45,
                                          color: const Color(0xFF8A8B7A),
                                        ),
                                        splashRadius: height / 45,
                                        onPressed: () => setState(() => _itemCount < 15 ? _itemCount++ : null)),
                                  ),
                                  SizedBox(width: width / 15),
                                  Container(
                                    height: height / 22,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(height / 50),
                                    ),
                                    child: Center(
                                      child: TextButtons(
                                        textButtonName: "Remove",
                                        color: Colors.black,
                                        textOnPress: () {},
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(height / 30),
        child: MainButton(
          textName: "Proceed to Checkout",
          textColor: Colors.black,
          mainOnPress: () {},
          backgroundColor: const Color(0xFFCED55B),
        ),
      ),
    );
  }
}
