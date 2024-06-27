import 'package:amirtha_ayurveda/application/features/auth/provider/auth_provider.dart';
import 'package:amirtha_ayurveda/application/features/auth/widgets/button.dart';
import 'package:amirtha_ayurveda/application/features/auth/widgets/login_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .25,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                  "assets/main_images/Annotation 2024-06-26 192742.png"),
            )),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Login Or Register To Book Your Appointments",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontSize: 26,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Form(
            key: authProvider.formKey,
            child: Column(
              children: [
                CustomTextField(
                    validator: "Enter Email",
                    controller:authProvider.emailController,
                    hintText: 'Enter your email',
                    label: 'Email',
                    obsecure: false),
                const SizedBox(height: 5),
                CustomTextField(
                    validator: "Enter password",
                    controller:authProvider.passwordController,
                    hintText: 'Enter password',
                    label: 'Password',
                    obsecure: true),
                const SizedBox(height: 70),
              ],
            ),
          ),
          CoustomButton(
            function: () async {
              if (authProvider.formKey.currentState!.validate()) {
                 authProvider.goTologin(username:authProvider.emailController.text, password:authProvider.passwordController.text, context: context);
              }
            },
            text: 'Login',
          ),
          const SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: RichText(
                text: const TextSpan(
                    style: TextStyle(letterSpacing: 1),
                    children: [
                  TextSpan(
                      text:
                          'By creating and logging into on account you are agreeing with our',
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                  TextSpan(
                      text: 'Terms and conditions',
                      style: TextStyle(color: Colors.blue, fontSize: 12)),
                  TextSpan(
                      text: 'and',
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                  TextSpan(
                      text: 'Privacy and policy',
                      style: TextStyle(color: Colors.blue, fontSize: 12)),
                ])),
          ),
        ],
      ),
    );
  }
}
