import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gide/widgets/navbar.dart';

class FavoritesPage extends StatelessWidget{
  FavoritesPage({Key? key}) : super(key: key);

  Widget build(BuildContext context){
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      
      body: Material(
        color:Color(0xFFF6F6F6),
        child: Stack(
          children: [
             Padding(
              padding: EdgeInsets.only(left: width * .077),
              child: Column(
                children: [
                  favorites(height, width)
                ],
              )
            ),
            
             Positioned(
                bottom: 0,
                left: 0,
                child: navBar()
              )
            
          ],
        )
           
        )
    );
    
      
  
  }

  Widget favoriteText(double height, double width){
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(top: height * .055),
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
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(top: height * .03),
        child: Container(
          width: width * .844,
          height: height * .14125,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(0xFFFFFFFF)
          ),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Color(0xFFFFFFFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                )
            ),
            child: Padding(
              padding: EdgeInsets.only(top: height * .015, bottom: height * .015),
              child: Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: width * .00125, right: width * .02,),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16), // Image border
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(46), // Image radius
                            child: Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg', fit: BoxFit.cover),
                          ),
                        )
                      )
                    ),
                    Expanded(
                      child: Container(
                        width: width * .075,
                        child:Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "TEST",
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 13,
                                  color: Colors.black
                                )
                              ),
                            ),
                            
                            Flexible(
                              child: SizedBox(
                                child: Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF838383),
                                    fontSize: 11
                                  ),
                                  // overflow: TextOverflow.ellipsis,
                                  // maxLines: 1,
                                  // softWrap: false,
                                )
                              )
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
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
                            )
                          ],
                        ),
                      )
                    )
                ],
              ),
            )
          )
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
            overScroll.disallowGlow();
            return false;
          },
          child: ListView.builder(
            
            padding: EdgeInsets.all(0),
            itemCount: 10,
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



