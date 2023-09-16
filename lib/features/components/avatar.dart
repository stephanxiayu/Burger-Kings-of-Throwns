import 'package:flutter/material.dart';


class Avatar extends StatelessWidget {
  final String image;
  final String name;
  final String id;
  const Avatar({super.key, required this.image, required this.name, required this.id, });

  @override
  Widget build(BuildContext context) {
    return ListTile(trailing:Image.network(image, height: 100, width: 100,),leading: Text(id),title: Text(name),);
    
  
  
  }
}