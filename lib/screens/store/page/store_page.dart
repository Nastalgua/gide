import 'package:flutter/material.dart';
import 'package:gide/screens/auth/page/favorites.dart';
import 'package:google_fonts/google_fonts.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TabController _tabController = TabController(length: 2, vsync: this);

    return Scaffold(
      extendBody: true,
      body: Material(
        color: const Color(0xFFF6F6F6),
        child: Column(
          children: [
            Container(
              height: height * 0.25,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/nippon_cha.jpg'),//TODO: image source from firebase of restaurant
                  fit: BoxFit.cover
                )
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(width * 0.05 / 2, 15, width * 0.05 / 2, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Nippon Cha',//todo: restaurant name from firebase
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w800
                  ),
                ),
              )
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(width * 0.05 / 2, 15, width * 0.05 / 2, 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(//todo: restaurant description from firebase
                  "All of our menu items are inspired by _____ cuisine and have been created by our head chef, (CN), after studying authentic _____ cuisine in ____. Not only do we have fresh flown-in seafood from the northeast, but we also have a variety of handcrafted cocktails, wine, and beer to choose from.",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF525252)
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  softWrap: false,
                ),
              ),
            ),
            const Divider(
              height: 0,
              thickness: 1,
              indent: 10,
              endIndent: 10,
              color: Color(0xFFBFBCBC),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                child: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  labelPadding: const EdgeInsets.only(left: 20, right: 20),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicator: CircleTabIndicator(color:Colors.black, radius: 4),
                  tabs: const [
                    Tab(text: 'Announcements'),
                    Tab(text: 'Items')
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: width * 0.9,
                margin: EdgeInsets.only(bottom: 20),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Column(
                      children: [
                        createAnnouncementField(width),
                        ScrollConfiguration(
                          behavior: MyBehavior(),
                          child: Expanded(
                            child: ListView.separated(
                              padding: const EdgeInsets.only(top: 20, bottom: 20),
                              shrinkWrap: true,
                              itemBuilder: (context, index) { 
                                return announcementTab(//todo: announcement & date of announcement from firebase
                                  "sds",
                                  '5/24/2022'
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(height: 10);
                              },
                              itemCount: 5,
                              
                            ),
                          ),
                        ),
                      ],
                    ),
                    ScrollConfiguration(
                      behavior: MyBehavior(),
                      child: ListView.separated(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return itemTab(//todo: item name & description from firebase
                            'shoes',
                            "All of our menu items are inspired by _____ cuisine and have been created by our head chef, (CN), afterstudying authentic _____ cuisine in ____. Not only do we have fresh flown-in seafood from the northeast,but we also have a variety of handcrafted cocktails, wine, and beer to choose from.",
                            height,
                            width//todo: add a way to pass img src
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(height: 10),
                        itemCount: 4
                      ),
                    )
                    
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget createAnnouncementField(double width) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFFFFFFF)
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.1,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextFormField(
            cursorColor: Colors.black,
            expands: true,
            maxLines: null,
            decoration: const InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: 'Create announcement here...'
            ),
          ),
        )
      )
    );
  }

  Widget announcementTab(String desc, String date){
    double width = MediaQuery.of(context).size.width;

    return FittedBox(
      child: Container(
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFFFFFFFF)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: width,
              padding: EdgeInsets.only(left: width * 0.1 / 2, right: width * 0.1 / 2),
              alignment: Alignment.centerLeft,
              child: Text(
                desc,
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF525252)
                ),
                softWrap: true,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: width * 0.1 / 2, right: width * 0.1 / 2, top: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                date,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFFA3A3A3)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget itemTab(String name, String desc, double height, double width){
    return Container(
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFFFFFFFF)
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: height * 0.14,
              width: height * 0.14,//width * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage('assets/images/noodles.png'),//todo: replace with img src
                  fit: BoxFit.cover
                )
              ),
            ),
            SizedBox(
              height: height * 0.16,
              width: width * 0.55,
              child: Column(
                children: [
                  Text(
                    name,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w800
                    ),
                  ),
                  Text(
                    desc,
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF525252)
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 6,
                    softWrap: false,
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}

class CircleTabIndicator extends Decoration{
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color:color, radius:radius);
  }
}

class _CirclePainter extends BoxPainter{
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});


  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    late Paint _paint;
    _paint = Paint()..color = color;
    _paint = _paint..isAntiAlias = true;

    final Offset circleOffset = Offset(configuration.size!.width/2 - radius/2, configuration.size!.height - 2.5 * radius);

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
