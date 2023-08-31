

import 'package:burgerking_apitest/CharakterModel/charktermode_class.dart';
import 'package:burgerking_apitest/Components/AppScaffold.dart';
import 'package:burgerking_apitest/Components/avatar.dart';
import 'package:burgerking_apitest/Components/shimmer.dart';
import 'package:burgerking_apitest/Screen/DetialScreen/DetailScreen.dart';

import 'package:burgerking_apitest/Service/api_request.dart';
import 'package:flutter/material.dart';
import 'package:burgerking_apitest/Screen/DetailPage.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
    static const String pageName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
List <CharacterModel >? data;

@override
  void initState() {
    fetchData();
    super.initState();
  }

 fetchData() async {
  var characters = await ApiService().getCharacters();
  setState(() {
    data = characters;
  });

  
}

  @override
Widget build(BuildContext context) {
  if (data == null) {
    return AppScaffold(
      appBar: AppBar(title: const Text("Loading...")),
      child: Center(child: ShimmerLoading()),
    );
  }

 

  return   AppScaffold(
  
    child: ListView.builder(
      itemCount: data!.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  fullName: data![index].fullName.toString(),
                         firstName: data![index].firstName.toString(),
                          lastName: data![index].lastName.toString(),
                          imageUrl:data![index].imageUrl.toString(), 
                          description: data![index].description.toString(),
                          title: data![index].title.toString(),
                  id: data![index].id,
                  family: data![index].family.toString(),
                ),
              ),
            );
          },
          child: Card(elevation: 9,
            child: Avatar(
              id: data![index].id.toString(),
              image: data![index].imageUrl.toString(),
              name: data![index].fullName.toString(),
            ),
          ),
        );
      },
    ),
  );
}

}


