import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 428,
            height: 915,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.00, -1.00),
                end: Alignment(0, 1),
                colors: [
                  Color(0x00FD7575),
                  Color(0x21961010),
                  Color(0xDB540101),
                  Colors.black
                ],
              ),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 8,
                  strokeAlign: BorderSide.strokeAlignOutside,
                  color: Color(0xFF191919),
                ),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 881,
                  child: Container(width: 428, height: 34, child: Stack()),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 427,
                    height: 915,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            NetworkImage("https://via.placeholder.com/427x915"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 440,
                    height: 915,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.00, -1.00),
                        end: Alignment(0, 1),
                        colors: [
                          Color(0xB2FD7575),
                          Color(0xCC961010),
                          Color(0xDB540101),
                          Colors.black
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 59,
                  top: 750,
                  child: Container(
                    width: 311,
                    height: 127,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 311,
                            height: 50,
                            decoration: ShapeDecoration(
                              color: Color(0xFFE89C2D),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 114,
                          top: 14,
                          child: Text(
                            'let’s start',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              height: 0,
                              letterSpacing: 0.48,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 74,
                          top: 83,
                          child: Text(
                            'Made by HomeBridge',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              height: 0,
                              letterSpacing: 0.42,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 140,
                          top: 107,
                          child: Text(
                            'v.1.0',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              height: 0,
                              letterSpacing: 0.39,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 30,
                  top: 401,
                  child: SizedBox(
                    width: 397,
                    height: 167,
                    child: Text(
                      'Botswana Housing Corporation',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 29,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 176,
                  top: 310,
                  child: Container(
                    width: 89,
                    height: 87,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 11, vertical: 16),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 67,
                          height: 55,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://via.placeholder.com/67x55"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
