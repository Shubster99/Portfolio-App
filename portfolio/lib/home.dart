import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

myAchieve(num, type) {
  return Row(
    children: [
      Text(num, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      Container(
        margin: EdgeInsets.only(
          top: 5,
        ),
        child: Text(type,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
      )
    ],
  );
}

mySpec(icon, tech) {
  return Container(
    width: 105,
    height: 115,
    child: Card(
      margin: EdgeInsets.all(0),
      color: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white),
            SizedBox(height: 10),
            Text(
              tech,
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    ),
  );
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Title(color: Colors.white, child: Text("Home",style: TextStyle(color: Colors.white),)),
        leading: PopupMenuButton(
          icon: Icon(Icons.menu,color: Colors.white,),
          color: Colors.black,
          itemBuilder: (context) => [
            PopupMenuItem(
              child: TextButton(child: Text("Projects", style: TextStyle(color: Colors.white),), onPressed: () {
                Navigator.pushNamed(context, "projects");
              }),
            ),
            PopupMenuItem(
              child: TextButton(child: Text("About-me",style: TextStyle(color: Colors.white)), onPressed: () {
                 Navigator.pushNamed(context, "about");
              }),
            )
          ],
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SlidingSheet(
        elevation: 8,
        cornerRadius: 50,
        snapSpec: const SnapSpec(
          // Enable snapping. This is true by default.
          snap: true,
          // Set custom snapping points.
          snappings: [0.38, 0.7, 1.0],
          // Define to what the snappings relate to. In this case,
          // the total available space that the sheet can expand to.
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        // The body widget will be displayed under the SlidingSheet
        // and a parallax effect can be applied to it.
        body: Container(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 30),
                child: ShaderMask(
                  shaderCallback: (rect) {
                    return LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black, Colors.transparent],
                    ).createShader(
                        Rect.fromLTRB(0, 0, rect.width, rect.height));
                  },
                  blendMode: BlendMode
                      .dstIn, // Optional, use BlendMode as per your requirement
                  child: Image.asset(
                    'assets/portfolio.jpg',
                    width: 500,
                    height: 550,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.49),
                child: Column(
                  children: [
                    Text("Shubham Gorwade",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 38,
                            fontWeight: FontWeight.bold)),
                    Text("Mobile App Developer",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              )
            ],
          ),
        ),
        builder: (context, state) {
          // This is the content of the sheet that will get
          // scrolled, if the content is bigger than the available
          // height of the sheet.
          return Container(
            margin: EdgeInsets.only(left: 30, right: 20, top: 20),
            height: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    myAchieve('78', "Projects"),
                    myAchieve('65', "Clients"),
                    myAchieve('99', "Messages"),
                  ],
                ),
                SizedBox(height: 30),
                Text("Specialized In",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        mySpec(Icons.android, 'Android'),
                        mySpec(Icons.flutter_dash_outlined, 'Flutter'),
                        mySpec(Icons.mobile_friendly, 'React-Native'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        mySpec(Icons.code, 'Java'),
                        mySpec(Icons.web, 'Nodejs'),
                        mySpec(Icons.roller_shades_closed_outlined, 'React'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        mySpec(Icons.html, 'Html'),
                        mySpec(Icons.css, 'Css'),
                        mySpec(Icons.javascript_rounded, 'JavaScript'),
                      ],
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
