import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class navBar extends StatelessWidget {

  Widget build(BuildContext context){
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      
      height: height * .11,
      width: width,
      color: Color.fromARGB(255, 255, 254, 254).withOpacity(0),
      child: Stack(
        children: [
          CustomPaint(
              size: Size(width, height),
              painter: navBarPainter(),
              
          ),
          Center(
            heightFactor: 0.4,
            child: FloatingActionButton(
              backgroundColor: Color(0xFFFFFFFF),
              child: SvgPicture.asset(
                    'assets/icons/navbar/pin-svgrepo-com 1.svg'
              ),
              elevation: 0.1, 
              onPressed: () {}),
          ),
          Container(
            width: width,
            height: height * .11,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon:SvgPicture.asset(
                    'assets/icons/navbar/home-svgrepo-com 1.svg'
                  )
                ),
                
                IconButton(
                  onPressed: () {},
                  icon:SvgPicture.asset(
                    'assets/icons/navbar/bell.svg'
                  )
                ),
                Container(
                  width: width * .2
                ),
               IconButton(
                  onPressed: () {},
                  icon:SvgPicture.asset(
                    'assets/icons/navbar/bookmark.svg'
                  )
                ),
                IconButton(
                  onPressed: () {},
                  icon:SvgPicture.asset(
                    'assets/icons/navbar/person.svg'
                  )
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}

class navBarPainter extends CustomPainter {
  void paint(Canvas canvas, Size size){
    Paint paint = new Paint()
    ..color = Colors.white..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, size.height * .1); // Start
    path.lineTo(size.width * 0.40, size.height * .13);
    path.arcToPoint(Offset(size.width * 0.60, size.height * .13), radius: Radius.circular(20.0), clockwise: false);
    path.lineTo(size.width, size.height * .13);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, size.height * .13);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}