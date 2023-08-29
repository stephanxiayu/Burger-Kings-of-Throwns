

import 'package:burgerking_apitest/CharakterModel/charktermode_class.dart';
import 'package:burgerking_apitest/Components/avatar.dart';
import 'package:burgerking_apitest/Screen/DetailPage.dart';
import 'package:burgerking_apitest/Service/api_request.dart';
import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
    return Scaffold(
      appBar: AppBar(title: Text("Loading...")),
      body: Center(child: ShimmerLoading()),
    );
  }

  return Scaffold(
    appBar: AppBar(title: Text("Burger Kings")),
    body: ListView.builder(
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




class ShimmerLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // This can be however many skeleton items you want to show
      itemBuilder: (_, __) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ShimmerCard(),
      ),
    );
  }
}

class ShimmerCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 48.0,
            height: 48.0,
            color: Colors.white,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 8.0,
                  color: Colors.white,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.0),
                ),
                Container(
                  width: double.infinity,
                  height: 8.0,
                  color: Colors.white,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.0),
                ),
                Container(
                  width: 40.0,
                  height: 8.0,
                  color: Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
