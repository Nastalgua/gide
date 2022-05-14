import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gide/widgets/navbar.dart';

class ProfilePage extends StatelessWidget{
  ProfilePage({Key? key}) : super(key: key);

  Widget build(BuildContext context){
    return Stack(
      children: [
        Column(
          children: [

          ],
        ),

        Positioned(
          bottom: 0,
          left: 0,
          child: navBar()
        )
      ],
    );
  }

  Widget accountText(double height, double width){
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.all(5),
          child: Container(
            height: 5,
            width: 5,
            child: SvgPicture.asset('assets/profile/settings')
          )
        ),
        Column(
          children: [
            Text('Account'),
            Text('Edit and manage your account details')
          ],
        )
      ],
    );
  }

  Widget profileBox(double height, double width){
    return Container(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [

          ],
        )
      )
    );
  }

  Widget aboutUsText(double height, double width){
    return Row(
      children: [

      ],
    );
  }
}