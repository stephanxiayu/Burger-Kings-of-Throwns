import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';

class CharacterCard extends StatelessWidget {
  final String imageUrl;
  final String fullName;
  final int id;
  final String firstName;
  final String lastName;
  final String title;
  final String family;

  const CharacterCard({
    required this.imageUrl,
    required this.fullName,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.title,
    required this.family,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: const EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(imageUrl, fit: BoxFit.cover),
          ),
          ListTile(
            title: Text("Character Detail"),
            subtitle: Text(fullName),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('ID: $id'),
                SizedBox(height: 5),
                Text('First Name: $firstName'),
                SizedBox(height: 5),
                Text('Last Name: $lastName'),
                SizedBox(height: 5),
                Text('Full Name: $fullName'),
                SizedBox(height: 5),
                Text('Title: $title'),
                SizedBox(height: 5),
                Text('Family: $family'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
