



import 'package:burgerking_apitest/Components/AppScaffold.dart';
import 'package:burgerking_apitest/Components/avatar_detail.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
     final String? description;
  final int id;
  final String? firstName;
  final String? lastName;
  final String? fullName;
  final String? title;
  final String? family;
  final String? image;
  final String? imageUrl;
  const DetailScreen({super.key, this.description, required this.id, this.firstName, this.lastName, this.fullName, this.title, this.family, this.image, this.imageUrl});
static const String pageName = "DetialScreen";
  @override
  Widget build(BuildContext context) {
    return  AppScaffold(appBar: AppBar( title: Text(fullName.toString()),),
      child: CharacterCard(id:id,
      family:family.toString(), firstName: firstName.toString(), fullName: fullName.toString(), imageUrl: imageUrl.toString(), lastName: lastName.toString(), title: title.toString(),),
    );
  }
}