import 'package:agile/styles/appColors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ONBOARD",
          style: TextStyle(letterSpacing: 5),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Appcolors.blue1_normal,
        child: Icon(Icons.arrow_forward_ios,color: Colors.white,),
        onPressed: () {
          if (currentIndex == 2) {
         
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => HomeScreen()),
            );
          } else {
         
            _controller.nextPage(
              duration: Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          }
        },
      ),

      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              children: [
                Page1(),
                Page2(),
                Page3(),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: ExpandingDotsEffect(
              activeDotColor: Appcolors.blue1_normal,
              dotHeight: 8,
              dotWidth: 8,
            ),
          ),

          SizedBox(height: 20),
        ],
      ),
    );
  }
}



class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("PAGE 1"));
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("PAGE 2"));
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("PAGE 3"));
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("HOME SCREEN")),
    );
  }
}
