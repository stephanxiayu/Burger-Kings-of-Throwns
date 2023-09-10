

import 'package:burgerking_apitest/Components/AppScaffold.dart';
import 'package:burgerking_apitest/Components/profilcomponent.dart';

import 'package:burgerking_apitest/Screen/Profiles/ProfilDetialScreen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});
  static const String pageName = "Profil des Entwicklers";

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {


  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      selectedPage: ProfilScreen.pageName,
      child: Column(mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // if (_imageFile != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: CircularPercentIndicator(
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
              ),
            ),
            const ProfilComponent(name: "Stephan",age: "39", work: 'Software Dude', uni: 'UIBE Peking', wohnen: 'Wohnt in Berlin',),

const Padding(
  padding: EdgeInsets.all(20.0),
  child:   Text("🌏🗾🏞️🏝️🌝🧑‍💻🏋️🏃🀄 Back in good old Berlin... "),
),
const Padding(
  padding: EdgeInsets.all(20.0),
  child:   Text("😊 Honesty in Internet: I am 1,78 cm tall but the Chinese government🇨🇳 has proven 1,80 cm with stamp 😋☝️🤣"),
)
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
