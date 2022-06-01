import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gide/widgets/navbar.dart';

class MainPage extends StatefulWidget{

  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>{
  String _searchText = "";

  void initState(){
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_){
      
    });
  }

  Widget build(BuildContext context){
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Material(
        child: SafeArea(
          child: Center(
            child: Container(
              width: width * .844,
              
                child: SingleChildScrollView(
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildTextField(context),
                      _buildFavStorePromotion(context),
                      _buildAnnouncements(context)
                    ],
                  ),
                ),
              
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * .1583,
      child: Center(
        child: TextField(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(11),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(11),
            ),
            hintText: "Search here...",
            hintStyle: const TextStyle(color: Color(0xFFC2C2C2)),
            suffixIcon: const Icon(Icons.search, color: Color(0xFF3D3D3D)),
            filled: true,
            fillColor: Colors.white
          ),
          onChanged: (text) {
            _searchText = text;
          },
        ),
      ),
    );
  }

  Widget _buildFavStorePromotion(BuildContext context){
    ScrollController sc = ScrollController(initialScrollOffset: 50);
   
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * .335,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: const Text('Favorite Store Promotions')
            ),
          ),
          SizedBox(height: height * .01),
          Expanded(
            child: Center(
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (OverscrollIndicatorNotification overScroll) {
                  return false;
                },
                child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    scrollbarTheme: ScrollbarThemeData(
                      thumbColor: MaterialStateProperty.all(Color(0xFF505050)),
                      trackVisibility: MaterialStateProperty.all(true),
                      trackColor: MaterialStateProperty.all(Color(0xFFE8E8E8)),
                      radius: Radius.circular(20),
                      thickness: MaterialStateProperty.all(height * .00875)
                    )
                  ),
                  child: Scrollbar(
                    isAlwaysShown: true,
                    controller: sc,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      controller: sc,
                      physics: ScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context, index) => _buildPromotionTab(context, 29, 'never lol', 'noods', 'food'),
                      separatorBuilder: (context, index) => SizedBox(width: height * .01875),
                    ),
                  ),
                ),
              )
              )
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPromotionTab(BuildContext context, int discount, String discountEnd, String name, String type){
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => {},
      child: Center(
        child: Column(
          children: [
            Container(
              height: height * .25875,
              width: width * .312625,
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(11),
              ),
              child: Container(
                width: width * .325,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          height: height * .15475,
                          width: width * .325,
                          child: Stack(
                            children: [
                              Center(
                                child: Container(
                                      height: height * .15125,
                                      width: width * .27125,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(11),
                                        child: Image.asset(
                                              'assets/images/noodles.png',
                                              fit: BoxFit.fill
                                            ),
                                      )
                                        
                                ),
                              ),
                              Positioned(
                                left: 20,
                                top: 10,
                                child: Container(
                                  width: width * .0578,
                                  height: height * .0175,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: const Color(0xFFFFFFFF)
                                  ),
                                  child: Center(
                                    child: Text(
                                      "-${discount}%",
                                      style: const TextStyle(
                                        fontSize: 8,
                                        color: Color(0xFF4670C1)
                                      )
                                    ),
                                  )
                                ),
                              ),
                              
                            ],
                          )
                        ),

                        Center(
                          child: Container(
                            width:  width * .27125,
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 14.5
                                    )
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    type,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xFF838383),
                                        fontSize: 11
                                    )
                                  ),
                                ),
                                SizedBox(height: height * .0175),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      discountEnd,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xFF4670C1),
                                        fontSize: 11.5
    
                                      )
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const Text(
                                          'Let\s Go ',
                                          style: TextStyle(
                                            fontSize: 11.5,
                                    
                                            fontFamily: 'Poppins'
                                            )
                                        ),
                                        SvgPicture.asset(
                                          'assets/icons/Arrow 1.svg',
                                          height: height * .01,
                                          width: width * .01,
                                          color: Colors.black,
                                        )
                                            
                                      ],
                                    ),
                                    
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ) 
                    ],
                  ),
                )
                
              )
            ),
            SizedBox(height: height * .00)
          ],
        ),
      ),
    );
  }

  Widget _buildAnnouncements(BuildContext context){
    
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * .445,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: height * .02),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: const Text('Announcements')
            ),
          ),
          SizedBox(height: height * .013),
          Expanded(
            child: Center(
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (OverscrollIndicatorNotification overScroll) {
                  overScroll.disallowGlow();
                  return false;
                },
                
                child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: Scrollbar(
                  isAlwaysShown: false,
                  thickness: 0,
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                        
                    itemCount: 10,
                    itemBuilder: (context, index) => _buildAnnouncementTab(context),
                    separatorBuilder: (context, index) => SizedBox(height: height * .03375),
                  ),
                ),
              )
              )
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAnnouncementTab(BuildContext context){
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => {},
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(11)
        ),
        width: width * .844,
        height: height * .14125,
        child: Center(
          child: Container(
            height: height * .11625,
            width: width * .7856,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'TEST',
                          style: TextStyle(
                            fontWeight: FontWeight.w900
                          )
                        ),
                      ),
                      //desc
                      Flexible(
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                          style: TextStyle(
                            fontSize: 11
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          softWrap: false,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'TEST',
                          style: TextStyle(
                            color: Color(0xFF4670C1),
                            fontSize: 11
                          )
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: height* .11125,
                  width: height * .11125,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(11),
                    child: Image.asset(
                      'assets/images/noodles.png',
                      fit: BoxFit.fill
                    ),
                  )
                                    
                ),
                
              ],
            ),
          ),
        ),
      ),
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