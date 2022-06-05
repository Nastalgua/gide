
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoritesPage extends StatelessWidget{
  const FavoritesPage({Key? key}) : super(key: key);

  Widget build(BuildContext context){
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Material(
        color:const Color(0xFFF6F6F6),
        child: Center(
          child: SizedBox(
            height: height,
            width: width * 0.8,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  favorites(height, width)
                ],
              ),
            ),
          ),
        )
           
      )
    );
  }

  Widget favoriteText(double height, double width){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Favorites',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              fontFamily: 'Poppins'
            )
          ),
      ),
    );
  }

  Widget favoriteTab(String name, String desc, double height, double width){
    return 
      ElevatedButton(
        onPressed: () {
          print("wrok");
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shadowColor: Colors.transparent,
          primary: const Color(0xFFFFFFFF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11)
          )
        ),
        child: Container(
          height: height * .14125,
          width: width * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11),
            color: const Color(0xFFFFFFFF)
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: height * .11,
                  width: height * 0.11,
                  margin: EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    image: const DecorationImage(
                      image:  AssetImage('assets/images/noodles.png'),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                Flexible(
                  child: SizedBox(
                      height: height * .09875,
                      width: width * .45,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              "TEST",
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 13,
                                color: Colors.black
                              )
                            ),
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              "All of our menu items are inspired by _____ cuisine and have been created by our head chef, (CN), after studying authentic _____ cuisine in ____. Not only do we have fresh flown-in seafood from the northeast, but we also have a variety of handcrafted cocktails, wine, and beer to choose from.",
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF838383),
                                fontSize: 9
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              softWrap: false,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                              const Text(
                                'Learn More ',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color(0xFF4670C1),
                                  fontFamily: 'Poppins'
                                  )
                              ),
                              SvgPicture.asset(
                                'assets/icons/Arrow 1.svg',
                                height: height * .01,
                                width: width * .01
                              )
                                  
                            ],
                                                ),
                          )
                                    
                        ],
                      )
                    ),
                  ),
                
                
              ],
            ),
          )
        )
      );
  }

  Widget favoriteList(double height, double width){
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body: Center(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overScroll) {
            return false;
          },
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: ListView.separated(
              itemCount: 10,
              itemBuilder: (context, index) => favoriteTab("TEST", "TEST", height, width),
              separatorBuilder: (context, index) => SizedBox(height: height * .01875),
            ),
          )
        )
      )
    );
  }

  Widget favorites(double height, double width){
    return SizedBox(
      height: height * .875,
      width: width,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Column(
          children: [
            favoriteText(height, width),
            Expanded(
              child: favoriteList(height, width)
            )
          ],
        ),
      )
    );
  } 
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

