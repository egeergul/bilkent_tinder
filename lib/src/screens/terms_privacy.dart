import 'package:bilkent_tinder/src/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TermsAndPrivacy extends StatelessWidget {
  const TermsAndPrivacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(Dimensions.height20),
          child: Column(
            children: [
                Text("Terms & Conditions", style: TextStyle(fontSize: Dimensions.font26, fontWeight: FontWeight.w900),), 
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: Dimensions.height15),
                  child: const Text("We have absolutely no terms and conditions! The entire responsibility of your privacy, safety and security is yours. Under no circumstances we accept any responsibility and will be held accountable!",
                  textAlign: TextAlign.justify,),
                ),
                Image.asset('lib/assets/images/sad_dog.jpg'),  
            ],
          ),
        ),
      ),
    );
  }
}