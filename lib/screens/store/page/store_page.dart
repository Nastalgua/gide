import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gide/core/models/announcement_model.dart';
import 'package:gide/core/models/store_model.dart';
import 'package:gide/core/services/auth_service.dart';
import 'package:gide/core/services/store_service.dart';
import 'package:gide/screens/auth/page/favorites.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StorePage extends StatefulWidget {
  final Store store;

  const StorePage({Key? key, required this.store}) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> with TickerProviderStateMixin {
  String _announcement = "";
  var _storeStream;

  final fieldText = TextEditingController();

  bool isOwner() {
    return widget.store.ownerId == AuthenticationService.getCurrentUser()!.uid;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _storeStream = FirebaseFirestore.instance.collection('stores').doc(widget.store.id).snapshots();
    _announcement = "";
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: Material(
        color: const Color(0xFFF6F6F6),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: height * 0.25,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/nippon_cha.jpg'),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: IconButton(
                    splashColor: Colors.transparent,  
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      // TODO: ADD here
                    }, 
                    icon: const Icon( // TODO: Add change here
                      Icons.favorite_border, 
                      color: Colors.pink,
                      size: 24.0, 
                    )
                  ),
                ),
              ]
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(width * 0.05 / 2, 15, width * 0.05 / 2, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.store.name,
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
                child: Text(
                  widget.store.description,
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
              color: Color.fromARGB(255, 230, 230, 230),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  labelPadding: const EdgeInsets.only(left: 20, right: 20),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicator: CircleTabIndicator(color:Colors.black, radius: 4),
                  tabs: const [
                    Tab(text: 'Announcements'),
                    Tab(text: 'Items'),
                    Tab(text: "Location"),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: width * 0.9,
                margin: const EdgeInsets.only(bottom: 20),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Column(
                      children: [
                        isOwner() ? createAnnouncementField(width) : Container(),
                        StreamBuilder<Object>(
                          stream: _storeStream,
                          builder: (context, snapshot) {
                            
                            if (snapshot.hasError) {
                              return const Text('Something went wrong');
                            }

                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const Text("Loading");
                            }
                            var d = snapshot.data as DocumentSnapshot;
                            
                            // print(d.data());
                            Store store = Store.fromFirestore(snapshot.data as DocumentSnapshot<Map<String, dynamic>>, null);

                            List<Announcement> announcementReversed = store.announcements!.reversed.toList();

                            return ScrollConfiguration(
                              behavior: MyBehavior(),
                              child: Expanded(
                                child: ListView.separated(
                                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) { 
                                    return announcementTab(//todo: announcement & date of announcement from firebase
                                      announcementReversed[index].text,
                                      _createDate(announcementReversed[index].timestamp.toDate())
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(height: 10);
                                  },
                                  itemCount: announcementReversed.length,
                                ),
                              ),
                            );
                          }
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        isOwner() ? createItemButton() : Container(),
                        ScrollConfiguration(
                          behavior: MyBehavior(),
                          child: ListView.separated(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              return itemTab(//todo: item name & description from firebase
                                widget.store.items![index].name,
                                widget.store.items![index].description,
                                widget.store.items![index].imageLink,
                                height,
                                width//todo: add a way to pass img src
                              );
                            },
                            separatorBuilder: (context, index) => const SizedBox(height: 10),
                            itemCount: widget.store.items!.length
                          ),
                        ),
                      ],
                    ), 
                    _MapTab(store: widget.store)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String _createDate(DateTime date) {
    return "${date.month}/${date.day}/${date.year}";
  }

  Widget createItemButton() {
    return ElevatedButton(
      onPressed: () {}, 
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFFFFFFFF)
        ),
        height: MediaQuery.of(context).size.height * 0.05,
      )
    );
  }

  Widget createAnnouncementField(double width) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFFFFFFF)
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.1,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: fieldText,
                onChanged: (value) {
                  setState(() {
                    _announcement = value;
                  });
                },
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
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              icon: const Icon(Icons.send), 
              onPressed: () {
                List<Announcement> announcements = widget.store.announcements != null ? [...widget.store.announcements!] : [];

                Announcement announcement = Announcement(
                  text: _announcement, 
                  timestamp: Timestamp.now(), 
                  storeId: widget.store.id
                );

                announcements.add(announcement);
                
                Store tempStore = Store(
                  id: widget.store.id, 
                  name: widget.store.name, 
                  description: widget.store.description, 
                  ownerId: widget.store.ownerId, 
                  location: widget.store.location, 
                  announcements: announcements, 
                  items: widget.store.items
                );

                StoreSerice.updateStore(tempStore);

                announcements.clear();
                fieldText.clear();
                setState(() {
                  _announcement = "";
                });
              },
              color: _announcement.isNotEmpty ? Colors.blue[300] : Colors.grey,
            )
          ),
        ],
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

  Widget itemTab(String name, String desc, String imageLink, double height, double width){
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
            Stack(
              children: [
                Container(
                  height: height * 0.14,
                  width: height * 0.14,//width * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(imageLink),//todo: replace with img src
                      fit: BoxFit.cover
                    )
                  ),
                ),
              ]
            ),
            SizedBox(
              height: height * 0.16,
              width: width * 0.55,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w800
                      ),
                    ),
                    Text(
                      desc,
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF525252)
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 6,
                      softWrap: false,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}

class _MapTab extends StatefulWidget {
  final Store store;

  const _MapTab({ Key? key, required this.store }) : super(key: key);

  @override
  State<_MapTab> createState() => _MapTabState();
}

class _MapTabState extends State<_MapTab> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  bool isMapVisible = false;

  Set<Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      curve: Curves.fastOutSlowIn,
      opacity: isMapVisible ? 1.0 : 0,
      duration: const Duration(milliseconds: 600),
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.store.location.latitude, widget.store.location.longitude), 
          zoom: 16
        ),
        mapType: MapType.normal,
        myLocationEnabled: true,
        zoomGesturesEnabled: false,
        scrollGesturesEnabled: false,
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        onMapCreated: _onMapCreated,
        markers: _markers,
      ),
    );
  }

    void _onMapCreated(GoogleMapController controller) async {
    await Future.delayed(
      const Duration(milliseconds: 550),
        () => setState(() {isMapVisible = true;}
      )
    );

    _markers.add(
      Marker(
        markerId: MarkerId(widget.store.id), 
        position: LatLng(widget.store.location.latitude, widget.store.location.longitude)
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
