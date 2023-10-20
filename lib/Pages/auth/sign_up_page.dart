import 'package:flavofleet_main/Pages/auth/auth_page.dart';
import 'package:flavofleet_main/Pages/auth/login_page.dart';
import 'package:flavofleet_main/Widgets/Utils/diamensions.dart';
import 'package:flavofleet_main/Widgets/Utils/app_text_field.dart';
import 'package:flavofleet_main/Widgets/Utils/big_text.dart';
import 'package:flavofleet_main/Widgets/no_internet.dart';
import 'package:flavofleet_main/firebase/auth/sign_in_with_google.dart';
import 'package:flavofleet_main/firebase/auth/sign_up.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: Dimensions.screenHeight * 0.03),
            //App logo
            SizedBox(
              height: Dimensions.screenHeight * 0.2,
              child: const Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 100,
                  backgroundImage: AssetImage('assets/image/food6.jpg'),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Hello',
                  style: TextStyle(
                      fontSize: Dimensions.font20 * 3,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
                Text(
                  'Register below with your details',
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
            //Your Name
            AppTextField(
              textController: nameController,
              hintText: 'Name',
              textColor: Colors.black87,
              icon: Icons.person,
            ),
            SizedBox(height: Dimensions.height20),
            // Your Email
            AppTextField(
              textController: emailController,
              hintText: 'Email',
              textColor: Colors.black87,
              keyboardType: TextInputType.emailAddress,
              icon: Icons.email,
            ),
            SizedBox(height: Dimensions.height20),

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
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Enter new password',
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
            SizedBox(height: Dimensions.height20),

            // Sign up Button
            GestureDetector(
              onTap: () async {
                bool isConnected =
                    await NoInternetWidget.checkInternetConnectivity();
                if (isConnected) {
                  await signUp(
                    context,
                    emailController.text,
                    passwordController.text,
                    nameController.text,
                  );
                } else {
                  NoInternetWidget.noInternetConnection(context);
                }
                // navigator!.pushReplacement(MaterialPageRoute(builder: (context) =>const HomePage(),));
              },
              child: Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width20, right: Dimensions.width20),
                width: Dimensions.screenWidth,
                height: Dimensions.screenHeight / 15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20 / 2),
                  color: Colors.black87,
                ),
                child: Center(
                  child: BigText(
                    text: 'Sign Up',
                    size: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: Dimensions.height20),

            RichText(
              text: TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap =
                        () => navigator!.pushReplacement(MaterialPageRoute(
                              builder: (context) => const SignInPage(),
                            )),
                  text: 'Already have an account ?',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 0, 48, 87),
                      fontSize: 15,
                      fontWeight: FontWeight.w500)),
            ),
            SizedBox(height: Dimensions.screenWidth * 0.05),
            //Sign up options
            RichText(
              text: TextSpan(
                  text: 'Sign up using one the following methods',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 15,
                  )),
            ),
            SizedBox(
              height: Dimensions.screenWidth * 0.01,
            ),
            GestureDetector(
              onTap: () async {
                final user = await signInWithGoogle();
                if (user != null) {
                  navigator!.pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const AuthPage(),
                    ),
                  );
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
