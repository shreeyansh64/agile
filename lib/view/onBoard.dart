import 'package:agile/styles/appColors.dart';
import 'package:agile/styles/appText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({super.key});

  @override
  Widget build(BuildContext context) {
    double _responsive(num) {
      final width = MediaQuery.widthOf(context);
      return (width / 360) * num;
    }

    return Scaffold(
      backgroundColor: Appcolors.blue1_normal,
      body: Padding(
        padding: EdgeInsets.all(_responsive(20)),
        child: Center(
          child: Column(
            children: [
              Spacer(),
              SizedBox(
                width: _responsive(84),
                height: _responsive(118.13),
                child: SvgPicture.asset('assets/onbLogo.svg'),
              ),
              SizedBox(height: _responsive(16.87)),
              Column(
                children: [
                  Text(
                    "Manage all your projects",
                    style: AppText.onboardingHeading(
                      context,
                    ).copyWith(color: Appcolors.white_light),
                  ),
                  Text(
                    "on one single board",
                    style: AppText.onboardingHeading(
                      context,
                    ).copyWith(color: Appcolors.white_light),
                  ),
                ],
              ),
              SizedBox(height: _responsive(25)),
              SizedBox(
                height: _responsive(337.01),
                width: _responsive(319.58),
                child: SvgPicture.asset('assets/onbScreen.svg'),
              ),
              SizedBox(height: _responsive(39),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: _responsive(45),
                    width: _responsive(149),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                       
                        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10))
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Text('Log In', style: AppText.button(context).copyWith(fontWeight: FontWeight.bold,color: Colors.black)),
                    ),
                  ),
                  SizedBox(
                    height: _responsive(45),
                    width: _responsive(149),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        
                        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10))
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: Text('Sign Up', style: AppText.button(context).copyWith(fontWeight: FontWeight.bold,color: Colors.black)),
                    ),
                  ),
                ],
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
