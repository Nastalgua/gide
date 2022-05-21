import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gide/core/constants/route_constants.dart';
import 'package:gide/core/services/auth_service.dart';
import 'package:gide/screens/auth/page/login_page.dart';

enum Page {
  home,
  notifications,
  favorites,
  profile
}

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final PageController _pageController = PageController(initialPage: 0);
  final Color _activeColor = Colors.pink;
  final Color _disableColor = Colors.black45;

  @override
  void initState() {
    super.initState();
    
    if (AuthenticationService.getCurrentUser() == null) {
      Navigator.of(context).pushNamed(loginRoute);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _createHomePage(),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.of(context).pushNamed(placeLocatorViewRoute);
        },
        child: SvgPicture.asset(
          'assets/icons/navbar/pin-svgrepo-com 1.svg'
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 15,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            height: 55,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    _pageController.animateToPage(
                      Page.home.index, 
                      duration: const Duration(milliseconds: 500), 
                      curve: Curves.ease
                    );
                  }, 
                  icon: SvgPicture.asset(
                    'assets/icons/navbar/home-svgrepo-com 1.svg',
                    color: (_currentIndex == Page.home.index) ? _activeColor : _disableColor,
                  )
                ),
                IconButton(
                  onPressed: () {
                    _pageController.animateToPage(
                      Page.notifications.index, 
                      duration: const Duration(milliseconds: 500), 
                      curve: Curves.ease
                    );
                  }, 
                  icon: SvgPicture.asset(
                    'assets/icons/navbar/bell.svg',
                    color: (_currentIndex == Page.notifications.index) ? _activeColor : _disableColor,
                  )
                ),
                Container(width: MediaQuery.of(context).size.width * 0.2),
                IconButton(
                  onPressed: () {
                    _pageController.animateToPage(
                      Page.favorites.index, 
                      duration: const Duration(milliseconds: 500), 
                      curve: Curves.ease
                    );
                  }, 
                  icon: SvgPicture.asset(
                    'assets/icons/navbar/bookmark.svg',
                    color: (_currentIndex == Page.favorites.index) ? _activeColor : _disableColor,
                  )
                ),
                IconButton(
                  onPressed: () {
                    _pageController.animateToPage(
                      Page.profile.index, 
                      duration: const Duration(milliseconds: 500), 
                      curve: Curves.ease
                    );
                  }, 
                  icon: SvgPicture.asset(
                    'assets/icons/navbar/person.svg',
                    color: (_currentIndex == Page.profile.index) ? _activeColor : _disableColor,
                  )
                ),
              ],
            ),
          )
        ),
      )
    );
  }

  Widget _createHomePage() {
    return SafeArea(
      bottom: false,
      child: PageView(
        controller: _pageController,
        onPageChanged: (newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        children: [
          BlueScreen(),
          RedScreen(),
          GreenScreen(),
          YellowScreen()
        ],
      ),
    );
  }
}

class BlueScreen extends StatelessWidget {
  const BlueScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red
    );
  }
}

class RedScreen extends StatelessWidget {
  const RedScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue
    );
  }
}

class GreenScreen extends StatelessWidget {
  const GreenScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green
    );
  }
}

class YellowScreen extends StatelessWidget {
  const YellowScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow
    );
  }
}