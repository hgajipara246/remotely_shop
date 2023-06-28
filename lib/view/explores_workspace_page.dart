import 'package:flutter/material.dart';

class ExploresWorkspacePage extends StatefulWidget {
  const ExploresWorkspacePage({Key? key}) : super(key: key);

  @override
  State<ExploresWorkspacePage> createState() => _ExploresWorkspacePageState();
}

class _ExploresWorkspacePageState extends State<ExploresWorkspacePage> {
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
                      borderSide: BorderSide(color: Color(0xFFC9CEDA)),
                    ),
                    fillColor: const Color(0xFFF6F6F5),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xFFC9CEDA)),
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
