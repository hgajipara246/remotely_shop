import 'package:flutter/material.dart';
import 'package:remotely_shop/res/common/app_button/main_button.dart';
import 'package:remotely_shop/view/all_done.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  String? payment;

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
            padding: EdgeInsets.symmetric(vertical: height / 100, horizontal: width / 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Checkout',
                  style: TextStyle(
                    color: const Color(0xFF040B14),
                    fontSize: width / 18,
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: height / 40),
                Text(
                  'PAYMENT',
                  style: TextStyle(
                    color: const Color(0xFFA6A798),
                    fontSize: width / 30,
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: height / 60),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: payment == payment ? const Color(0xFFDDDDDA) : const Color(0xFF8ADD4B),
                    ),
                    borderRadius: BorderRadius.circular(
                      height / 90,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: width / 13),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/visa_card.png",
                          height: height / 50,
                        ),
                        SizedBox(width: width / 40),
                        Text(
                          'Abbyn Bank',
                          style: TextStyle(
                            color: const Color(0xFF040B14),
                            fontSize: width / 30,
                            fontFamily: 'Avenir',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(width: width / 40),
                        const Icon(
                          Icons.circle,
                          size: 5,
                          color: Color(0xFFA6A798),
                        ),
                        SizedBox(width: width / 100),
                        const Icon(
                          Icons.circle,
                          size: 5,
                          color: Color(0xFFA6A798),
                        ),
                        SizedBox(width: width / 100),
                        const Icon(
                          Icons.circle,
                          size: 5,
                          color: Color(0xFFA6A798),
                        ),
                        SizedBox(width: width / 100),
                        const Icon(
                          Icons.circle,
                          size: 5,
                          color: Color(0xFFA6A798),
                        ),
                        SizedBox(width: width / 40),
                        Text(
                          '8910',
                          style: TextStyle(
                            color: const Color(0xFFA6A798),
                            fontSize: width / 30,
                            fontFamily: 'Avenir',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(width: width / 10),
                        Expanded(
                          child: RadioListTile(
                            value: "visa",
                            groupValue: payment,
                            onChanged: (value) {
                              setState(() {
                                payment = value.toString();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height / 60),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: payment == payment ? const Color(0xFFDDDDDA) : const Color(0xFF8ADD4B),
                    ),
                    borderRadius: BorderRadius.circular(
                      height / 90,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: width / 13),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/master_card.png",
                          height: height / 30,
                        ),
                        SizedBox(width: width / 40),
                        Text(
                          'Abbyn Bank',
                          style: TextStyle(
                            color: const Color(0xFF040B14),
                            fontSize: width / 30,
                            fontFamily: 'Avenir',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(width: width / 40),
                        const Icon(
                          Icons.circle,
                          size: 5,
                          color: Color(0xFFA6A798),
                        ),
                        SizedBox(width: width / 100),
                        const Icon(
                          Icons.circle,
                          size: 5,
                          color: Color(0xFFA6A798),
                        ),
                        SizedBox(width: width / 100),
                        const Icon(
                          Icons.circle,
                          size: 5,
                          color: Color(0xFFA6A798),
                        ),
                        SizedBox(width: width / 100),
                        const Icon(
                          Icons.circle,
                          size: 5,
                          color: Color(0xFFA6A798),
                        ),
                        SizedBox(width: width / 40),
                        Text(
                          '8910',
                          style: TextStyle(
                            color: const Color(0xFFA6A798),
                            fontSize: width / 30,
                            fontFamily: 'Avenir',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(width: width / 9),
                        Expanded(
                          child: RadioListTile(
                            value: "master",
                            groupValue: payment,
                            onChanged: (value) {
                              setState(() {
                                payment = value.toString();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height / 25),
                Text(
                  'SHIPPING INFORMATION',
                  style: TextStyle(
                    color: const Color(0xFF898A7A),
                    fontSize: width / 30,
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: height / 50),
                Image.asset("assets/images/map.png"),
                SizedBox(height: height / 60),
                Text(
                  'Address',
                  style: TextStyle(
                    color: const Color(0xFFC1C2B8),
                    fontSize: width / 30,
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: height / 200),
                Text(
                  '6391 Elgin St. Celina, Delaware 10299',
                  style: TextStyle(
                    color: const Color(0xFF040B14),
                    fontSize: width / 25,
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: height / 55),
                Text(
                  'Phone number',
                  style: TextStyle(
                    color: const Color(0xFFC1C2B8),
                    fontSize: width / 30,
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: height / 200),
                Text(
                  '(480) 555-0103',
                  style: TextStyle(
                    color: const Color(0xFF040B14),
                    fontSize: width / 25,
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: height / 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal',
                      style: TextStyle(
                        color: const Color(0xFFA6A798),
                        fontSize: width / 30,
                        fontFamily: 'Avenir',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '\$248.00',
                      style: TextStyle(
                        color: const Color(0xFF898A7A),
                        fontSize: width / 25,
                        fontFamily: 'Avenir',
                        fontWeight: FontWeight.w800,
                      ),
                    )
                  ],
                ),
                SizedBox(height: height / 250),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Shipping cost',
                      style: TextStyle(
                        color: const Color(0xFFA6A798),
                        fontSize: width / 30,
                        fontFamily: 'Avenir',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '\$50.00',
                      style: TextStyle(
                        color: const Color(0xFF898A7A),
                        fontSize: width / 25,
                        fontFamily: 'Avenir',
                        fontWeight: FontWeight.w800,
                      ),
                    )
                  ],
                ),
                SizedBox(height: height / 250),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        color: const Color(0xFF07120E),
                        fontSize: width / 25,
                        fontFamily: 'Avenir',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      '\$298.00',
                      style: TextStyle(
                        color: const Color(0xFFBA5C3D),
                        fontSize: width / 20,
                        fontFamily: 'Avenir',
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: width / 25),
        child: SizedBox(
          width: double.infinity,
          child: MainButton(
            textName: "Checkout \$298.00",
            textColor: Colors.black,
            mainOnPress: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const AllDone(),
                ),
                (route) => false),
            backgroundColor: const Color(0xFFCED55B),
          ),
        ),
      ),
    );
  }
}
