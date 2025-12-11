import 'package:agile/styles/appColors.dart';
import 'package:flutter/material.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  @override
  Widget build(BuildContext context) {
    double _responsive(num) {
      final width = MediaQuery.widthOf(context);
      return (width / 360) * num;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){Navigator.pop(context);},
          icon: CircleAvatar(backgroundColor: Appcolors.black_light_active.withOpacity(0.7),radius: _responsive(32),child: Icon(Icons.arrow_back,color: Appcolors.black_dark,size: _responsive(20),)),
        ),
      ),
    );
  }
}
