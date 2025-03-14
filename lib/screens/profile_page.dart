import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../widgets/build_elivated_button_widget.dart';
import '../widgets/build_text_feild_widget.dart';
import '../widgets/build_text_widget.dart';
import '../widgets/custom_drop_down_feild.dart';

class ProfilePage extends StatefulWidget {
  final String? profileImage;

  const ProfilePage({
    super.key,
    this.profileImage,
  });

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String selectedState = "N1 2LL";
  final TextEditingController emailController =
      TextEditingController(text: 'aashifa@gmail.com');
  final TextEditingController passwordController =
      TextEditingController(text: 'asdfads');
  final TextEditingController pinCodeController =
      TextEditingController(text: '450116');
  final TextEditingController addressController =
      TextEditingController(text: '216 St Pauls Rd, ');
  final TextEditingController cityController =
      TextEditingController(text: 'London');
  final TextEditingController countryController =
      TextEditingController(text: 'United Kingdom');
  final TextEditingController accountController =
      TextEditingController(text: '204356XXXXXXX');
  final TextEditingController accountNameController =
      TextEditingController(text: 'Abhiraj Sisodiya');
  final TextEditingController ifcController =
      TextEditingController(text: 'SBIN00428');

  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: BuildTextWidget(
          text: "Profile",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: AppColors.grey,
                    backgroundImage: widget.profileImage != null
                        ? NetworkImage(widget.profileImage!)
                        : AssetImage("assets/images/kids.png") as ImageProvider,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.edit, color: Colors.white, size: 20),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            BuildTextWidget(
                text: 'Personal Details',
                fontSize: 18,
                color: AppColors.black,
                fontWeight: FontWeight.w600),
            SizedBox(height: 20),
            BuildTextWidget(text: 'Email Address', fontSize: 14),
            BuildTextFeildWidget(
                controller: emailController, fillColor: AppColors.white),
            SizedBox(height: 30),
            BuildTextWidget(text: 'Password', fontSize: 14),
            BuildTextFeildWidget(
              controller: passwordController,
              prefixIcon: Icons.lock_outline,
              fillColor: AppColors.white,
              obscureText: !isPasswordVisible,
              suffixIcon: IconButton(
                icon: Icon(isPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: BuildTextWidget(
                text: 'Change Password',
                color: AppColors.red,
                fontWeight: FontWeight.w500,
                textDecoration: TextDecoration.underline,
                underlineColor: AppColors.red,
              ),
            ),
            SizedBox(height: 10),
            Divider(color: AppColors.grey),
            SizedBox(height: 30),
            BuildTextWidget(
                text: 'Business Address Details',
                color: AppColors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16),
            SizedBox(height: 20),
            BuildTextWidget(text: 'Pincode', fontSize: 14),
            BuildTextFeildWidget(
                fillColor: AppColors.white, controller: pinCodeController),
            SizedBox(height: 30),
            BuildTextWidget(text: 'Address', fontSize: 14),
            BuildTextFeildWidget(
                fillColor: AppColors.white, controller: addressController),
            SizedBox(height: 30),
            BuildTextWidget(text: 'City', fontSize: 14),
            BuildTextFeildWidget(
                fillColor: AppColors.white, controller: cityController),
            SizedBox(height: 30),
            CustomDropDownFeild(
              label: "State",
              items: ["N1 2LL", "N2 3AA", "N3 4BB"],
              initialValue: "N1 2LL",
              onChanged: (value) {
                print("Selected State: $value");
              },
            ),
            SizedBox(height: 30),
            BuildTextWidget(text: 'Country', fontSize: 14),
            BuildTextFeildWidget(
                fillColor: AppColors.white, controller: countryController),
            SizedBox(height: 30),
            Divider(color: AppColors.grey),
            SizedBox(height: 30),
            BuildTextWidget(
                text: 'Bank Account Details',
                color: AppColors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16),
            SizedBox(height: 30),
            BuildTextWidget(text: 'Bank Account Number', fontSize: 14),
            BuildTextFeildWidget(
                fillColor: AppColors.white, controller: accountController),
            SizedBox(height: 30),
            BuildTextWidget(text: "Account Holder’s Name", fontSize: 14),
            BuildTextFeildWidget(
                fillColor: AppColors.white, controller: accountNameController),
            SizedBox(height: 30),
            BuildTextWidget(text: "IFSC Code", fontSize: 14),
            BuildTextFeildWidget(
                fillColor: AppColors.white, controller: ifcController),
            SizedBox(height: 25),
            BuildElivatedButtonWidget(
              text: 'Save',
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder:(context) =>   CheckoutPage(
                //   // size: _selectedSize,
                // ),));
              },
              color: AppColors.button_color,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
