import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopywelll/screens/profile_page.dart';

import '../utils/app_colors.dart';
import '../widgets/build_text_widget.dart';
import '../widgets/carosil_slider_widget.dart';
import '../widgets/category_widget.dart';
import '../widgets/deal_of_the_day_widget.dart';
import '../widgets/new_arrival_widget.dart';
import '../widgets/product_list_widget.dart';
import '../widgets/special_offer_widget.dart';
import '../widgets/trending_product_widget.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor:  AppColors.ScaffoldColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: AppColors.black),
          onPressed: () {},
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png',width: 97.11,height: 31.99,)
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              if (user != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(profileImage: user!.photoURL),
                  ),
                );
              } else {
                print("User not signed in");
              }
            },
            child: CircleAvatar(
              backgroundColor: AppColors.grey,
              backgroundImage: user?.photoURL != null ? NetworkImage(user!.photoURL!) : null,
              child: user?.photoURL == null ? Icon(Icons.person, color: Colors.black) : null,
              radius: 25,
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search any Product...",
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.mic),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BuildTextWidget(text: 'All Featured',fontSize: 18,fontWeight: FontWeight.bold,color: AppColors.black,),
                  Row(
                    children: [
                      Icon(Icons.sort, color: Colors.black),
                      SizedBox(width: 10),
                      Icon(Icons.filter_list, color: Colors.black),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            CategoryWidget(),
            SizedBox(height: 10),
            CarosilSliderWidget(),
            SizedBox(height: 10),
            DealOfTheDayWidget(),
            SizedBox(height: 10),
            ProductListWidget(),
            SizedBox(height: 10),
            SpecialOfferWidget(),
            SizedBox(height: 10),
            TrendingProductsWidget(),
            SizedBox(height: 10),
            NewArrivalsWidget(),
          ],
        ),
      ),
    );
  }
}






















