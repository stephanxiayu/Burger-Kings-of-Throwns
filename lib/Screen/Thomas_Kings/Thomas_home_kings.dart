

import 'package:burgerking_apitest/Screen/StephansKings/Stephanshome.dart';
import 'package:burgerking_apitest/Service/thomas_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../CharakterModel/thomas_character_class.dart';

class ThomasHomeScreen extends StatefulWidget {
  const ThomasHomeScreen({super.key});

  @override
  State<ThomasHomeScreen> createState() => _ThomasHomeScreenState();
}

class _ThomasHomeScreenState extends State<ThomasHomeScreen> {
List<ThomasCharacter>? data;






@override
  void initState() {
    fetchData();
    super.initState();
  }

fetchData() async {
var character = await ThomasApiService().getCharacterById(583);
if (character != null) {
  setState(() {
    data = [character];
  });
}

}



@override
Widget build(BuildContext context) {
  if (data == null) {
    return Scaffold(
      appBar: AppBar(title: const Text("Loading...")),
      body: Center(child: ShimmerLoading()), // Assuming you've a ShimmerLoading widget
    );
  } else {
    return Scaffold(
      appBar: AppBar(title: const Text("Characters")),
      body: ListView.builder(
        itemCount: data!.length, // Number of items in your list
        itemBuilder: (context, index) {
          ThomasCharacter character = data![index];
          return ListTile(
            title: Text(character.name), // Assuming you've a name property in ThomasCharacter class
            // Add more properties of ThomasCharacter if you want to display them
            // subtitle: Text(character.gender), for example
          );
        },
      ),
    );
  }
}

}