

import 'package:burgerking_apitest/CharakterModel/charktermode_class.dart';
import 'package:burgerking_apitest/Components/avatar.dart';
import 'package:burgerking_apitest/Screen/StephansKings/Stephanshome.dart';
import 'package:burgerking_apitest/Screen/Thomas_Kings/Thomas_home_kings.dart';

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

 int _currentIndex = 0;
  final List<Widget> _children = [
   const StephanHomeScreen(),
    const ThomasHomeScreen()
  
  ];

  @override
Widget build(BuildContext context) {
  if (data == null) {
    return Scaffold(
      appBar: AppBar(title: const Text("Loading...")),
      body: Center(child: ShimmerLoading()),
    );
  }

 

  return Scaffold(
   
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Stephans Burger',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Thomas Kings',
          ),
          
        ],
      ),
    );
  }
}
  
  
  
//    Scaffold(
//     appBar: AppBar(title: Text("Burger Kings")),
//     body: ListView.builder(
//       itemCount: data!.length,
//       itemBuilder: (context, index) {
//         return GestureDetector(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => DetailPage(
//                   fullName: data![index].fullName.toString(),
//                          firstName: data![index].firstName.toString(),
//                           lastName: data![index].lastName.toString(),
//                           imageUrl:data![index].imageUrl.toString(), 
//                           description: data![index].description.toString(),
//                           title: data![index].title.toString(),
//                   id: data![index].id,
//                   family: data![index].family.toString(),
//                 ),
//               ),
//             );
//           },
//           child: Card(elevation: 9,
//             child: Avatar(
//               id: data![index].id.toString(),
//               image: data![index].imageUrl.toString(),
//               name: data![index].fullName.toString(),
//             ),
//           ),
//         );
//       },
//     ),
//   );
// }

// }




