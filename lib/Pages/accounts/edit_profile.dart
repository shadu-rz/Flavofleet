// import 'dart:typed_data';
// // import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flavofleet_main/Utils/util_image.dart';
// import 'package:flavofleet_main/firebase/firebase_methods.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class EditProfile extends StatefulWidget {
//   const EditProfile({super.key});

//   @override
//   EditProfilePageState createState() => EditProfilePageState();
// }

// class EditProfilePageState extends State<EditProfile> {
//   // File? image;
//   // String? imageUrl;
//   // final picker = ImagePicker();
//   Uint8List? _image;
//   TextEditingController nameController = TextEditingController();
//   TextEditingController mobileController = TextEditingController();
//   TextEditingController emailController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     loadUserData();
//   }

//   Future loadUserData() async {
//     final userData = await FirebaseFirestore.instance
//         .collection('users')
//         .doc(FirebaseAuth.instance.currentUser!.uid)
//         .get();

//     if (userData.exists) {
//       setState(() {
//         nameController.text = userData.data()!['username'];
//         mobileController.text = userData.data()!['phoneNumber'];
//         emailController.text = userData.data()!['email'];
//       });
//     }
//   }
//   void selectImage()async{
//     Uint8List img = await pickImage(ImageSource.gallery);
//     setState(() {
//       _image = img;
//     });
//   }

//   // void selectImage() async {
//   //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    
//   //   setState(() {
//   //     if (pickedFile != null) {
//   //       _ = File(pickedFile.path);
//   //     } else {
//   //       log('No _ selected.');
//   //     }
//   //   });
//   // }

//   // Future uploadImageToFirebase(File imageFile) async {
//   //   final user = FirebaseAuth.instance.currentUser;
//   //   final Reference storageReference = FirebaseStorage.instance
//   //       .ref()
//   //       .child('profileImages')
//   //       .child('${user!.uid}.jpg');

//   //   final UploadTask uploadTask = storageReference.putFile(imageFile);

//   //   await uploadTask.whenComplete(() async {
//   //     final imageUrl = await storageReference.getDownloadURL();
//   //     setState(() {
//   //       this.imageUrl = imageUrl;
//   //     });
//   //   });
//   //   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Edit Profile'),
//         centerTitle: true,
//         actions: [
//           IconButton(
//               onPressed: () async {
//                 // Save the profile information here
//                 String name = nameController.text;
//                 String mobile = mobileController.text;
//                 String email = emailController.text;

//                 // await uploadImageToFirebase(_!);
//                 // await FirebaseMethods().addUserDetails(
//                 //   email: email,
//                 //   phoneNumber: mobile,
//                 //   _: imageUrl!,
//                 //   username: name,
//                 // );
//               },
//               icon: const Icon(Icons.done))
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: <Widget>[
//               GestureDetector(
//                 onTap: () {
//                   selectImage();
//                 },
//                 child: CircleAvatar(
//                   radius: 64,
//                   backgroundImage: _image != null ? MemoryImage(_image!) : null,
//                   child: _image == null
//                       ? const Icon(
//                           Icons.camera_alt,
//                           size: 40,
//                         )
//                       : null,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               TextField(
//                 controller: nameController,
//                 decoration: const InputDecoration(
//                   labelText: 'Name',
//                 ),
//               ),
//               const SizedBox(height: 20),
//               TextField(
//                 keyboardType: TextInputType.phone,
//                 controller: mobileController,
//                 decoration: const InputDecoration(
//                   labelText: 'Mobile Number',
//                 ),
//               ),
//               const SizedBox(height: 20),
//               TextField(
//                 keyboardType: TextInputType.emailAddress,
//                 controller: emailController,
//                 decoration: const InputDecoration(
//                   labelText: 'Email',
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
