import 'package:ecommerce_app/styles/colors.dart';
import 'package:flutter/material.dart';


AppBar defaultAppBar(BuildContext context) {
  return AppBar(
    elevation: 2,
    backgroundColor: whiteColor,
    leading: IconButton(
      icon: const Icon(Icons.dehaze_outlined,color: redColor,size: 25,),
      onPressed: () {
      },
    ),
    titleSpacing: 0,
    title:Center(
      child: Image.asset('assets/images/logo.jpg',fit: BoxFit.cover,height: 70,width: 90,),
    ),
    actions: const [
      Padding(
        padding:  EdgeInsets.only(right: 10),
        child:  Icon(
          Icons.search_outlined,
          color: redColor,size: 25,
        ),
      ),]
  ,
  );
}