import 'package:e_commerce_flutter/presentation/components/widget.dart';
import 'package:e_commerce_flutter/presentation/screens/pages/loginpage.dart';
import 'package:e_commerce_flutter/presentation/themes/colors.dart';
import 'package:flutter/material.dart';

import '../widgets/export_widget.dart';

class ProfilePage extends StatelessWidget {
   ProfilePage({super.key});
 final List icons = [Icons.favorite_border_outlined, Icons.location_city, Icons.language_outlined, Icons.help_center_outlined, Icons.contact_mail_outlined];
 final List text = ['Favourites', 'Addresses', 'Language', 'Help', 'Contacts'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFrave(
                text: 'Profile',
                fontSize: 24,
              ),
              SizedBox(height: 15),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return LogInPage();
                  }));
                },
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 10,
                            spreadRadius: 10)
                      ]),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.person_add_alt_1_outlined,
                                color: ColorsUI.primaryColorFrave,
                              ),
                              SizedBox(width: 20),
                              TextFrave(text: 'Sign in')
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
              SizedBox(height: 25),
              Container(
                height: 330,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade200,
                          blurRadius: 10,
                          spreadRadius: 10)
                    ]),
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Options(icon: icons[index],text: text[index],);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
