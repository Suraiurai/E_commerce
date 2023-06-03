import 'package:e_commerce_flutter/presentation/components/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';


class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 90),
              TextFrave(text: 'Enter your full name to log in'),
              SizedBox(height: 15),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextFormFrave(
                    controller: controller,
                    hintText: 'Full Name',
                  )),
              SizedBox(height: 30),
              TextFrave(text: 'Enter your Phone number'),
              SizedBox(height: 15),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextFormFrave(
                    controller: controller,
                    number: '+993',
                  )),
                  SizedBox(height: 40),
              BtnFrave(
                text: 'Log In',
                width: 200,
                radius: 30,
                height: 45,
              )
            ],
          ),
        ),
      ),
    );
  }
}
