import 'package:flutter/material.dart';
import 'package:share_your_park/model_data/m_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<SliderModel> slides = new List<SliderModel>();
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    slides = getSlides();
  }

  Widget pageIndexIndicator(bool isCurrentPage) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.grey : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          itemCount: slides.length,
          onPageChanged: (val) {
            setState(() {
              currentIndex = val;
            });
          },
          itemBuilder: (context, index) {
            return SliderTile(
              imageAssetPath: slides[index].getImageAssetPath(),
            );
          }),
          bottomSheet: currentIndex!= slides.length -1? 
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  onTap: (){},
                  child: Text("skip")
                ),
                Row(children: <Widget>[
            for(int i = 0; i < slides.length; i++) currentIndex == i ?pageIndexIndicator(true) : pageIndexIndicator(false)
              ],
            ),
                InkWell(
                  onTap: (){},
                  child: Text("next")
                ),
          ],
          ),
         )
    );
  }
}

// ignore: must_be_immutable
class SliderTile extends StatelessWidget {
  String imageAssetPath, title, desc;
  SliderTile({this.imageAssetPath, this.title, this.desc});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(imageAssetPath),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
