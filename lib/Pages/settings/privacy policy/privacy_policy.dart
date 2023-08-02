import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Last updated: August 02, 2023',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'This Privacy Policy describes Our policies and procedures on the collection, use, and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.',
              ),
              SizedBox(height: 10),
              Text(
                'We use Your Personal data to provide and improve the Service. By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy. This Privacy Policy has been created with the help of the Free Privacy Policy Generator.',
              ),
              SizedBox(height: 20),
              Text(
                'Interpretation and Definitions',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Interpretation',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.',
              ),
              SizedBox(height: 10),
              Text(
                'Definitions',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'For the purposes of this Privacy Policy:',
              ),
              SizedBox(height: 5),
              Text(
                '- Account means a unique account created for You to access our Service or parts of our Service.',
              ),
              // Add the rest of the definitions here...
              // ...
              SizedBox(height: 20),
              Text(
                'Collecting and Using Your Personal Data',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              // Add the content for "Collecting and Using Your Personal Data" section...
              // ...
              // ...
              SizedBox(height: 20),
              Text(
                'Use of Your Personal Data',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              // Add the content for "Use of Your Personal Data" section...
              // ...
              // ...
              SizedBox(height: 20),
              Text(
                'Retention of Your Personal Data',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              // Add the content for "Retention of Your Personal Data" section...
              // ...
              // ...
              SizedBox(height: 20),
              Text(
                'Transfer of Your Personal Data',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              // Add the content for "Transfer of Your Personal Data" section...
              // ...
              // ...
              SizedBox(height: 20),
              Text(
                'Delete Your Personal Data',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              // Add the content for "Delete Your Personal Data" section...
              // ...
              // ...
              SizedBox(height: 20),
              Text(
                'Disclosure of Your Personal Data',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              // Add the content for "Disclosure of Your Personal Data" section...
              // ...
              // ...
              SizedBox(height: 20),
              Text(
                'Security of Your Personal Data',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              // Add the content for "Security of Your Personal Data" section...
              // ...
              // ...
              SizedBox(height: 20),
              Text(
                'Children\'s Privacy',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              // Add the content for "Children's Privacy" section...
              // ...
              // ...
              SizedBox(height: 20),
              Text(
                'Links to Other Websites',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              // Add the content for "Links to Other Websites" section...
              // ...
              // ...
              SizedBox(height: 20),
              Text(
                'Changes to this Privacy Policy',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              // Add the content for "Changes to this Privacy Policy" section...
              // ...
              // ...
              SizedBox(height: 20),
              Text(
                'Contact Us',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'If you have any questions about this Privacy Policy, You can contact us:',
              ),
              SizedBox(height: 5),
              Text(
                'By email: shaadurz@gmail.com',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
