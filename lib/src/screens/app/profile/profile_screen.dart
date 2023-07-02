import 'package:bilkent_tinder/src/screens/app/profile/about_me_widget.dart';
import 'package:bilkent_tinder/src/screens/app/profile/relationship_goals_widget%20copy.dart';
import 'package:flutter/material.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() =>
      _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<int> top = <int>[];
  List<int> bottom = <int>[0];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    
      body:  SingleChildScrollView(
          child: Column(children: [
            AboutMeWidget(),
            RelationshipGoalsWidget()
          ]),
      ),
    );
  }
}

