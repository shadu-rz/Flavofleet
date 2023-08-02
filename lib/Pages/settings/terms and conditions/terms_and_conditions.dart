// import 'package:flutter/material.dart';


// class TermsAndConditionsPage extends StatelessWidget {
//   const TermsAndConditionsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return 
//      Scaffold(
//         appBar: AppBar(title: const Text('Terms and Conditions')),
//         body: SingleChildScrollView(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Welcome to Flavor fleet!',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'These terms and conditions outline the rules and regulations for the use of Flavor fleet\'s Website, located at www.flavorfleet.com.',
//               ),
//               const SizedBox(height: 16),
//               RichText(
//                 text: const TextSpan(
//                   text: 'By accessing this website we assume you accept these terms and conditions. Do not continue to use Flavor fleet if you do not agree to take all of the terms and conditions stated on this page.',
//                   style: TextStyle(color: Colors.black),
//                 ),
//               ),
             
//               const SizedBox(height: 16),
//               const Text(
//                 'License',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 8),
//               const Text(
//                 'Unless otherwise stated, Flavor fleet and/or its licensors own the intellectual property rights for all material on Flavor fleet. All intellectual property rights are reserved. You may access this from Flavor fleet for your own personal use subjected to restrictions set in these terms and conditions.',
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'You must not:',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 8),
//               const Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('• Republish material from Flavor fleet'),
//                   Text('• Sell, rent or sub-license material from Flavor fleet'),
//                   Text('• Reproduce, duplicate or copy material from Flavor fleet'),
//                   Text('• Redistribute content from Flavor fleet'),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'Parts of this website offer an opportunity for users to post and exchange opinions and information in certain areas of the website. Flavor fleet does not filter, edit, publish or review Comments prior to their presence on the website. Comments do not reflect the views and opinions of Flavor fleet,its agents and/or affiliates. Comments reflect the views and opinions of the person who post their views and opinions. To the extent permitted by applicable laws, Flavor fleet shall not be liable for the Comments or for any liability, damages or expenses caused and/or suffered as a result of any use of and/or posting of and/or appearance of the Comments on this website.',
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'Flavor fleet reserves the right to monitor all Comments and to remove any Comments which can be considered inappropriate, offensive or causes breach of these Terms and Conditions.',
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'You warrant and represent that:',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 8),
//               const Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('• You are entitled to post the Comments on our website and have all necessary licenses and consents to do so;'),
//                   Text('• The Comments do not invade any intellectual property right, including without limitation copyright, patent or trademark of any third party;'),
//                   Text('• The Comments do not contain any defamatory, libelous, offensive, indecent or otherwise unlawful material which is an invasion of privacy'),
//                   Text('• The Comments will not be used to solicit or promote business or custom or present commercial activities or unlawful activity.'),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'You hereby grant Flavor fleet a non-exclusive license to use, reproduce, edit and authorize others to use, reproduce and edit any of your Comments in any and all forms, formats or media.',
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'Hyperlinking to our Content',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 8),
//               const Text(
//                 'The following organizations may link to our Website without prior written approval:',
//               ),
//               const SizedBox(height: 8),
//               const Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('• Government agencies;'),
//                   Text('• Search engines;'),
//                   Text('• News organizations;'),
//                   Text('• Online directory distributors may link to our Website in the same manner as they hyperlink to the Websites of other listed businesses; and'),
//                   Text('• System wide Accredited Businesses except soliciting non-profit organizations, charity shopping malls, and charity fundraising groups which may not hyperlink to our Web site.'),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'These organizations may link to our home page, to publications or to other Website information so long as the link: (a) is not in any way deceptive; (b) does not falsely imply sponsorship, endorsement or approval of the linking party and its products and/or services; and (c) fits within the context of the linking party\'s site.',
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'We may consider and approve other link requests from the following types of organizations:',
//               ),
//               const SizedBox(height: 8),
//               const Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('• commonly-known consumer and/or business information sources;'),
//                   Text('• dot.com community sites;'),
//                   Text('• associations or other groups representing charities;'),
//                   Text('• online directory distributors;'),
//                   Text('• internet portals;'),
//                   Text('• accounting, law and consulting firms; and'),
//                   Text('• educational institutions and trade associations.'),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'We will approve link requests from these organizations if we decide that: (a) the link would not make us look unfavorably to ourselves or to our accredited businesses; (b) the organization does not have any negative records with us; (c) the benefit to us from the visibility of the hyperlink compensates the absence of Flavor fleet; and (d) the link is in the context of general resource information.',
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'These organizations may link to our home page so long as the link: (a) is not in any way deceptive; (b) does not falsely imply sponsorship, endorsement or approval of the linking party and its products or services; and (c) fits within the context of the linking party\'s site.',
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'If you are one of the organizations listed in paragraph 2 above and are interested in linking to our website, you must inform us by sending an e-mail to Flavor fleet. Please include your name, your organization name, contact information as well as the URL of your site, a list of any URLs from which you intend to link to our Website, and a list of the URLs on our site to which you would like to link. Wait 2-3 weeks for a response.',
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'Approved organizations may hyperlink to our Website as follows:',
//               ),
//               const SizedBox(height: 8),
//               const Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('• By use of our corporate name; or'),
//                   Text('• By use of the uniform resource locator being linked to; or'),
//                   Text('• By use of any other description of our Website being linked to that makes sense within the context and format of content on the linking party\'s site.'),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'No use of Flavor fleet\'s logo or other artwork will be allowed for linking absent a trademark license agreement.',
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'iFrames',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 8),
//               const Text(
//                 'Without prior approval and written permission, you may not create frames around our Webpages that alter in any way the visual presentation or appearance of our Website.',
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'Content Liability',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 8),
//               const Text(
//                 'We shall not be hold responsible for any content that appears on your Website. You agree to protect and defend us against all claims that is rising on your Website. No link(s) should appear on any Website that may be interpreted as libelous, obscene or criminal, or which infringes, otherwise violates, or advocates the infringement or other violation of, any third party rights.',
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'Reservation of Rights',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 8),
//               const Text(
//                 'We reserve the right to request that you remove all links or any particular link to our Website. You approve to immediately remove all links to our Website upon request. We also reserve the right to amen these terms and conditions and it\'s linking policy at any time. By continuously linking to our Website, you agree to be bound to and follow these linking terms and conditions.',
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'Removal of links from our website',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 8),
//               const Text(
//                 'If you find any link on our Website that is offensive for any reason, you are free to contact and inform us any moment. We will consider requests to remove links but we are not obligated to or so or to respond to you directly.',
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'We do not ensure that the information on this website is correct, we do not warrant its completeness or accuracy; nor do we promise to ensure that the website remains available or that the material on the website is kept up to date.',
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'Disclaimer',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 8),
//               const Text(
//                 'To the maximum extent permitted by applicable law, we exclude all representations, warranties and conditions relating to our website and the use of this website. Nothing in this disclaimer will:',
//               ),
//               const SizedBox(height: 8),
//               const Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('• limit or exclude our or your liability for death or personal injury;'),
//                   Text('• limit or exclude our or your liability for fraud or fraudulent misrepresentation;'),
//                   Text('• limit any of our or your liabilities in any way that is not permitted under applicable law; or'),
//                   Text('• exclude any of our or your liabilities that may not be excluded under applicable law.'),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'The limitations and prohibitions of liability set in this Section and elsewhere in this disclaimer: (a) are subject to the preceding paragraph; and (b) govern all liabilities arising under the disclaimer, including liabilities arising in contract, in tort and for breach of statutory duty.',
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'As long as the website and the information and services on the website are provided free of charge, we will not be liable for any loss or damage of any nature.',
//               ),
//               const SizedBox(height: 16),
//               const Center(
//                 child: Text(
//                   'Flutter App by Your Mohamed Shaduli',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
    
//   }
// }
