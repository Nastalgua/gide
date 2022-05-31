import 'package:flutter/material.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:gide/core/constants/route_constants.dart';
import 'package:gide/core/models/store_model.dart';
import 'package:gide/screens/place_locator/indicator.dart';
import 'package:gide/screens/place_locator/result_item.dart';

class BottomBar extends StatefulWidget {
  final List<Store> stores;
  final int selectedIndex;
  final Function(int) updateSelectedIndex;
  final PageController pageController;
  final Function(double, double) updateCameraPosition;

  const BottomBar({ 
    Key? key, 
    required this.stores, 
    required this.selectedIndex,
    required this.updateSelectedIndex,
    required this.pageController,
    required this.updateCameraPosition
  }) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final geo = Geoflutterfire();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 100),
      bottom: 15,
      right: 15,
      left: 15,
      child: GestureDetector(
        onVerticalDragEnd: (dragUpdateDetails) { // TODO: Change the page here
          Navigator.of(context).pushNamed(profileRoute);
        },
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFFCFCFC), 
            borderRadius: BorderRadius.circular(8)
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                width: 28.0,
                height: 6.0,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(8.0)
                ),
              ),
              SizedBox(
                width: width,
                height: height * 0.28,
                child: PageView.builder(
                  controller: widget.pageController,
                  onPageChanged: ((index) {
                    setState(() {
                      widget.updateSelectedIndex(index);
                    });

                    widget.updateCameraPosition(widget.stores[index].location.latitude, widget.stores[index].location.longitude);
                  }),
                  itemCount: widget.stores.length,
                  itemBuilder: (context, index) {
                    return ResultItem(store: widget.stores[index]);
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(widget.stores.length, (index) => Indicator(isActive: widget.selectedIndex == index ? true : false))
                  ],
                ),
              )
            ],
          )
        ),
      )
    );
  }
}
