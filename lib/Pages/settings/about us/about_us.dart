import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('About us'),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  'Welcome To Flavofleet',
                  style: TextStyle(color: Colors.black, fontSize: 24.0),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Hello and Welcome to our Application Flavofleet. We are glad that you want to know something more About Us. Therefore, we have taken the initiative to help you by providing a better solution to your problems. Our first priority is to provide you with a better solution to solve your problem and queries. If you don’t find a solution to your problem, please let us know in the comments section. Also, we are trying to provide fresh and latest content that provides you ideas about all the updated information that’s happening in the world.',
                style: TextStyle(color: Colors.black, fontSize: 16.0),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16.0),
              Text(
                'In the below section, you can get more ideas about our app like our Application category and content category. If you have additional questions or require more information, don’t hesitate to contact us through email at shaadurz@gmail.com or you can contact us through our contact us form.',
                style: TextStyle(color: Colors.black, fontSize: 16.0),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16.0),
              Text(
                'What is Our Goal?',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16.0),
              Text(
                'There are millions of Applications created every day, also, there is much fake content spread on the internet. Our main goal is to provide you with 100% Original and Safe content that provides you with a great and better experience on the world wide web. We mainly focus on our service and improving it regularly to provide a better user experience to all users. Our main priority is to search for new content and present it in front of you to learn something new.',
                style: TextStyle(color: Colors.black, fontSize: 16.0),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16.0),
              Text(
                'What is our Service?',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16.0),
              Text(
                'We are mainly focused on food ordering related content. If you are interested in ecommerce, then you can visit daily to get more latest information. On our Application Flavofleet, we focus on many other categories and we hope you like also, the content of other categories that are maintained on our Application. You can visit our Application homepage to know all category details.',
                style: TextStyle(color: Colors.black, fontSize: 16.0),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16.0),
              Text(
                'Admin’s Statement for Flavofleet',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16.0),
              Text(
                'As per my point of view, there are many people who visit the internet to get some information but 90% of the time they get wrong information. So, the first priority of our Application Flavofleet is to provide 100% legit and accurate information to our users. I hope my dream comes true one day, and our Application will provide Original Content to provide a better user experience. So, From my Side thanks for visiting our Application.',
                style: TextStyle(color: Colors.black, fontSize: 16.0),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16.0),
              Text(
                'Admin’s Contact Information',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16.0),
              Text(
                'Hi, this Mohamed Shaduli, in the above paragraph you know about the Application properly and now I am going to provide my contact details. These details are my personal Account details. If you have any problem and suggestions for this Application then you can contact me by using following contact details.',
                style: TextStyle(color: Colors.black, fontSize: 16.0),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16.0),
              Text(
                'Name: Mohamed Shaduli',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 8.0),
              Text(
                'Email: shaadurz@gmail.com',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16.0),
              Center(
                child: Text(
                  'Thanks For Visiting Our app\n\nHave a nice day!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
