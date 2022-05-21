
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gide/widgets/navbar.dart';

class FavoritesPage extends StatelessWidget{
  const FavoritesPage({Key? key}) : super(key: key);

  Widget build(BuildContext context){
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Material(
        color:Color(0xFFF6F6F6),
        child: SafeArea(
          child: Stack(
            children: [
               Padding(
                padding: EdgeInsets.only(left: width * .077, right: width  *.077 ),
                child: Column(
                  children: [
                    favorites(height, width)
                  ],
                )
              ),   
              
            ],
          ),
        )
           
        )
    );
  }

  Widget favoriteText(double height, double width){
    return const Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(top: 0),
          child: Text(
            'Favorites',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins'
            )
          ),
      )
    );
    
  }

  Widget favoriteTab(String name, String desc, double height, double width){
    return Padding(
      padding: EdgeInsets.only(top: height * .015),
      child: ElevatedButton(
        onPressed: () {},
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11),
            color: Color(0xFFFFFFFF)
          ),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: height * .09875,
                width: width * .25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  image: const DecorationImage(
                    image:  AssetImage('assets/images/noodles.png'),
                    fit: BoxFit.cover
                  )
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: width * .03, right: width * .03 ),
                  child: Container(
                    height: height * .09875,
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
              )
              
              
            ],
          )
        )
      ),
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
          child: ListView.builder(
            
            padding: EdgeInsets.all(0),
            itemCount: 5,
            itemBuilder: (context, index) => favoriteTab("TEST", "TEST", height, width),
          )
        )
      )
    );
  
    
  }

  Widget favorites(double height, double width){
    return Container(
      height: height * .9039,
      width: width,
      child: Column(
        children: [
          favoriteText(height, width),
          Expanded(
                child: favoriteList(height, width)
              )
        ],
      )
    );
  }

  
}



