import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_your_park/const.dart';
import 'package:share_your_park/views/tuto/intro_end.dart';
import 'package:share_your_park/views/tuto/slide.dart';

class ScreenSlide extends StatefulWidget {
  @override
  _ScreenSlideState createState() => _ScreenSlideState();
}

class _ScreenSlideState extends State<ScreenSlide> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    Widget circleBar(bool isActive) {
      return AnimatedContainer(
        duration: Duration(milliseconds: 150),
        margin: EdgeInsets.symmetric(horizontal: 8),
        height: isActive ? 12 : 8,
        width: isActive ? 12 : 8,
        decoration: BoxDecoration(
            color: isActive ? Colors.pinkAccent : Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12))),
      );
    }

    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: Container(
                decoration: BoxDecoration(
                  gradient: kPrimaryGradientColor,
                ),
                child: Stack(
                  children: [
                    PageView.builder(
                        itemCount: listSlide.length,
                        onPageChanged: (int page) {
                          setState(() {
                            currentPage = page;
                          });
                        },
                        itemBuilder: (context, index) {
                          // ignore: unused_local_variable
                          Slide slide = listSlide[index];
                          return Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 45),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Text(
                                    slide.title,
                                    style: TextStyle(
                                        fontFamily: kfontFamily,
                                        color: kTextColor,
                                        fontSize: width * 0.06),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    child: Image.asset(
                                      slide.image,
                                    ),
                                  ),
                                ),
                                //le sizebox ra ilain
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    slide.description,
                                    style: TextStyle(
                                        fontFamily: kfontFamily,
                                        color: kTextColor,
                                        fontSize: width * 0.038),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                    Align(
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        margin: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            for (int i = 0; i < listSlide.length; i++)
                              if (i == currentPage) ...[circleBar(true)] else
                                circleBar(false)
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                        visible: currentPage == listSlide.length - 1,
                        child: Container(
                            padding: EdgeInsets.all(11),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: FloatingActionButton(
                                backgroundColor: Color(0xFFFF008D),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => IntroEnd()));
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(80))),
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ))),
                  ],
                ))));
  }
}
