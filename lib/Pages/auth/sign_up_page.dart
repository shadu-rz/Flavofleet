import 'package:flavour_fleet_main/Pages/auth/sign_in_page.dart';
import 'package:flavour_fleet_main/Widgets/Utils/diamensions.dart';
import 'package:flavour_fleet_main/Widgets/app_text_field.dart';
import 'package:flavour_fleet_main/Widgets/big_text.dart';
import 'package:flavour_fleet_main/firebase/auth/sign_up.dart';
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
  var confirmPasswordController = TextEditingController();
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    // void _registration() {

    // }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: Dimensions.screenHeight * 0.1),
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
                      fontSize: Dimensions.font20 * 3 + Dimensions.font20 / 1.5,
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
            // AppTextField(
            //   textController: nameController,
            //   hintText: 'Name',
            //   textColor: Colors.black87,
            //   icon: Icons.person,
            // ),
            // SizedBox(height: Dimensions.height20),
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
            // AppTextField(
            //   obscureText: true,
            //   textColor: Colors.black87,
            //   textController: confirmPasswordController,
            //   hintText: 'Conform Password',
            //   icon: Icons.password_sharp,
            // ),
            // SizedBox(height: Dimensions.height20),

            // Sign up Button
            GestureDetector(
              onTap: () async {
                await signUp(
                    context, emailController.text, passwordController.text);
                // navigator!.pushReplacement(MaterialPageRoute(builder: (context) =>const HomePage(),));
              },
              child: Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width20, right: Dimensions.width20),
                width: Dimensions.screenWidth,
                height: Dimensions.screenHeight / 14,
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
            SizedBox(height: Dimensions.height30),

            RichText(
              text: TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap =
                        () => navigator!.pushReplacement(MaterialPageRoute(
                              builder: (context) => SignInPage(),
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
              height: Dimensions.screenWidth * 0.05,
            ),
            Container(
              height: 50,
              width: 100,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/image/google-logo.png'))),
            )
            // Wrap(
            //   children: List.generate(
            //       2,
            //       (index) => Container(
            //             margin: EdgeInsets.only(right: Dimensions.height10),
            //             height: Dimensions.height10 * 4.6,
            //             width: Dimensions.height10 * 4.6,
            //             decoration: BoxDecoration(
            //                 color: Colors.grey[300],
            //                 borderRadius:
            //                     BorderRadius.circular(Dimensions.radius20),
            //                 border: Border.all(
            //                     width: 2,
            //                     color:
            //                         const Color.fromARGB(255, 208, 208, 208))),
            //             child: Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: CircleAvatar(
            //                 radius: 20,
            //                 backgroundColor: Colors.transparent,
            //                 backgroundImage: AssetImage(signupImages[index]),
            //               ),
            //             ),
            //           )),
            // )
          ],
        ),
      ),
    );
  }
}
