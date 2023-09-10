
import 'package:burgerking_apitest/Components/avatar_detail.dart';
import 'package:burgerking_apitest/Shared/styles.dart';
import 'package:flutter/material.dart';


class DetailPage extends StatelessWidget {
     final String? description;
  final int id;
  final String? firstName;
  final String? lastName;
  final String? fullName;
  final String? title;
  final String? family;
  final String? image;
  final String? imageUrl;
  const DetailPage({super.key, this.description, required this.id, this.firstName, this.lastName, this.fullName, this.title, this.family, this.image, this.imageUrl});
static const String pageName = "DetialScreen";
  @override
  Widget build(BuildContext context) {
    return  Scaffold(backgroundColor: Styles.of(context).darkblue,
      appBar: AppBar(backgroundColor:Styles.of(context).darkblue,
         title: Text(fullName.toString()),),
      body: CharacterCard(id:id,
      family:family.toString(), firstName: firstName.toString(), fullName: fullName.toString(), imageUrl: imageUrl.toString(), lastName: lastName.toString(), title: title.toString(),),
    );
  }
}