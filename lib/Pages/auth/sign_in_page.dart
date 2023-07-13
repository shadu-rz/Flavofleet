import 'package:flavour_fleet_main/Pages/Home/home_page.dart';
import 'package:flavour_fleet_main/Pages/auth/auth_page.dart';
import 'package:flavour_fleet_main/Pages/auth/sign_up_page.dart';
import 'package:flavour_fleet_main/Widgets/Utils/diamensions.dart';
import 'package:flavour_fleet_main/Widgets/app_text_field.dart';
import 'package:flavour_fleet_main/Widgets/big_text.dart';
import 'package:flavour_fleet_main/firebase/auth/sign_in_with_email_and_pass.dart';
import 'package:flavour_fleet_main/firebase/auth/sign_in_with_google.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  var emailController = TextEditingController();
  var passwordControllerr = TextEditingController();
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.screenHeight * 0.05,
            ),
            //App logo
            SizedBox(
              height: Dimensions.screenHeight * 0.25,
              child: const Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 100,
                  backgroundImage: AssetImage('assets/image/food6.jpg'),
                ),
              ),
            ),
            //welcome
            Container(
              width: double.maxFinite,
              margin: EdgeInsets.only(
                  left: Dimensions.width20 + Dimensions.width10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello',
                    style: TextStyle(
                        fontSize:
                            Dimensions.font20 * 3 + Dimensions.font20 / 1.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  Text(
                    'Sign into your account',
                    style: TextStyle(
                        fontSize: Dimensions.font20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[500]),
                  ),
                  SizedBox(
                    height: Dimensions.screenHeight * 0.02,
                  )
                ],
              ),
            ),

            // Your Email
            AppTextField(
              textController: emailController,
              hintText: 'Email',
              textColor: Colors.black87,
              icon: Icons.email,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            // Your Password
            Container(
              margin: EdgeInsets.only(
                  left: Dimensions.height20, right: Dimensions.height20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 5,
                        offset: const Offset(1, 10),
                        color: Colors.grey.withOpacity(0.2))
                  ]),
              child: TextField(
                keyboardType: TextInputType.name,
                obscureText: passwordVisible,
                controller: passwordControllerr,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  prefixIcon: const Icon(
                    Icons.password,
                    color: Colors.black,
                  ),
                  suffixIcon: IconButton(
                    color: Colors.black,
                    onPressed: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                    icon: Icon(
                      passwordVisible ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(width: 1.0, color: Colors.white)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(width: 1.0, color: Colors.white)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            SizedBox(height: Dimensions.height30),
            // Sign In Button
            GestureDetector(
              onTap: () async {
                signUserIn(
                    context, emailController.text, passwordControllerr.text);
              },
              child: Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width20, right: Dimensions.width20),
                width: Dimensions.screenWidth,
                height: Dimensions.screenHeight / 14,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius20 / 2),
                    color: Colors.black87),
                child: Center(
                  child: BigText(
                    text: 'Sign In',
                    size: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: Dimensions.height30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: "Don't Have an account? ",
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () =>
                              navigator!.pushReplacement(MaterialPageRoute(
                                builder: (context) => const SignUpPage(),
                              )),
                        text: "Create",
                        style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: Dimensions.screenWidth * 0.05),
            //Sign up options
            RichText(
              text: TextSpan(
                  text: 'Sign up using one the following method',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 16,
                  )),
            ),
            SizedBox(
              height: Dimensions.screenWidth * 0.05,
            ),
            GestureDetector(
              onTap: () async {
                final user = await signInWithGoogle();
                if (user != null) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const AuthPage(),));
                }
              },
              child: Container(
                height: 50,
                width: 100,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/image/google-logo.png'))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
