import 'package:burgerking_apitest/Shared/global_contraoller.dart';

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
      GlobalController globalController= GlobalController();
    return Card( color: globalController.darkblue,
    shadowColor: Colors.white,
      elevation: 5.0,
      margin: const EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(width: double.infinity,
              decoration: BoxDecoration(border: Border.all(color: Colors.white)),
              child: Image.network(imageUrl, fit: BoxFit.cover)),
          ),
          ListTile(
            title: const Text("King des Monats"),
            subtitle: Text(fullName),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
             
                const SizedBox(height: 5),
                Text('First Name: $firstName'),
                const SizedBox(height: 5),
                Text('Last Name: $lastName'),
                const SizedBox(height: 5),
                Text('Full Name: $fullName'),
                const SizedBox(height: 5),
                Text('Title: $title'),
                const SizedBox(height: 5),
                Text('Family: $family'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
