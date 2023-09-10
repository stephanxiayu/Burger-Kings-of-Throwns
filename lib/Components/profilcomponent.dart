

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProfilComponent extends StatelessWidget {
  final String name; 
  final String age; 
  final String work;
  final String uni;
  final String wohnen;

  const ProfilComponent({super.key, required this.name, required this.age, required this.work, required this.uni, required this.wohnen});


  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(name, style: const TextStyle(fontSize: 25),),
          ), Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(age,style: const TextStyle(fontSize: 25)),
          ), const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.check_circle, color: Colors.blue,),
          )
        ],),

      ),
      Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(children: [
          Row(children: [const Icon(Icons.work),const SizedBox(width: 10,), Text(work)],),
           Row(children: [const Icon(Icons.school),const SizedBox(width: 10,), Text(uni)],),
            Row(children: [const Icon(Icons.house),const SizedBox(width: 10,),Text(wohnen)],),
        ],),
      ),
      const SizedBox(height: 10,),
      const Divider(height: 2,thickness: 2,)


    ],);
  }
}