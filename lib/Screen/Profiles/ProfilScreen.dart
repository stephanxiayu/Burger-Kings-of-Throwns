

import 'package:burgerking_apitest/Components/AppScaffold.dart';

import 'package:burgerking_apitest/Screen/Profiles/ProfilDetialScreen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProfilScreen extends StatefulWidget {
  ProfilScreen({super.key});
  static const String pageName = "ProfilScreen";

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  XFile? _imageFile;  // Change PickedFile? to XFile?

  Future<XFile?> _getImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    return pickedFile;
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Column(mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // if (_imageFile != null)
            CircularPercentIndicator(
  radius: 120.0,
  lineWidth: 13.0,
  animation: true,
  percent: 0.95,
  center: GestureDetector(onTap: (){
 
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) =>  ProfilDetailScreen(),
    ),
  );
   
  },
    child: GestureDetector(onTap: () {
      Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) =>  ProfilDetailScreen(),
    ),
  );
    },
      child: const CircleAvatar(
        radius: 100,  // Adjust to fit within the CircularPercentIndicator
        backgroundImage:AssetImage("assets/bild.jpeg")
        //  FileImage(File(_imageFile!.path)),
      ),
    ),
  ),
  circularStrokeCap: CircularStrokeCap.round,
  progressColor: Colors.red,
  footer: Container(width: 200,height: 30,
    color: Colors.red,
    child: const Center(child: Text("95 % Vollständig", style: TextStyle(color: Colors.white, fontSize: 20),))),
),

          // ElevatedButton(
          //   child: Text("Pick Image"),
          //   onPressed: () async {
          //     final pickedImage = await _getImageFromGallery();
          //     if (pickedImage != null) {
          //       setState(() {
          //         _imageFile = pickedImage;
          //       });
          //     }
          //   },
          // ),
        ],
      ),
    );
  }
}
