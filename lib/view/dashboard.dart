import 'package:agile/styles/appText.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Dashboard",style: AppText.heading(context),),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.red.withOpacity(0.4),
        foregroundColor: Colors.transparent,
        elevation: 0,
        // shape: CircleBorder(),
        onPressed: ()async{
        final box = await Hive.openBox('auth');
        await box.delete('access_token');
        Navigator.pushReplacementNamed(context, '/');
      },icon: Icon(Icons.exit_to_app,color: Colors.black,),
      label: Text("LOGOUT",style: TextStyle(letterSpacing: 5,color: Colors.black),),
      ),
    );
  }
}