import 'package:flutter/material.dart';

class CreateContact extends StatelessWidget {
  const CreateContact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Новый контакт"),
        centerTitle: false,
      ),
      body: CustomScrollView(
        slivers: [
          
        ],
      ),
    );
  }
}