import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gide/core/constants/route_constants.dart';
import 'package:gide/screens/auth/page/login_page.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Something went wrong..."));
          } else if (snapshot.hasData) {
            return _createHomePage(); // put the home page here
          }

          return const LoginPage();
        },
      ),
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
          child: BottomNavigationBar(
            elevation: 0,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: Theme.of(context).primaryColor.withAlpha(0),
            selectedItemColor: Theme.of(context).colorScheme.onSurface,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/navbar/home-svgrepo-com 1.svg',
                ),
                label: "Home"
                
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/navbar/bell.svg',
                ),
                label: "Notifications"
              ),
              BottomNavigationBarItem(icon: Container(),
                label: "Favorites"
              ),
              BottomNavigationBarItem(icon: SvgPicture.asset(
                  'assets/icons/navbar/bookmark.svg',
                ),
                label: "Favorites"
              ),
              BottomNavigationBarItem(icon: SvgPicture.asset(
                  'assets/icons/navbar/person.svg',
                ),
                label: "Profile"
              ),
            ],
          )
        ),
      )
    );
  }

  Widget _createHomePage() {
    return SafeArea(
      bottom: false,
      child: PageView(
        children: [
          BlueScreen(),
          RedScreen()
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