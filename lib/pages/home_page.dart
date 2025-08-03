import 'package:flutter/material.dart';
import 'package:not_so_simple_chat_app/components/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [

        ],
      ),
      drawer: MyDrawer(),
    );
  }
}
