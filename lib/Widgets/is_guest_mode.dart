import 'package:flavour_fleet_main/Pages/auth/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IsGuestMode extends StatelessWidget {
  const IsGuestMode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              navigator!.pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const SignInPage(),
                ),
                (router)=> false
              );
            },
            icon: const Icon(
              Icons.person_add,
              size: 50,
            ),
          ),
          const Text('Create account'),
        ],
      ),
    );
  }
}
