import 'package:flutter/material.dart';

import '../../shared/components/components.dart';

class AddAnimals extends StatelessWidget {
  get itemBuilder => null;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Animals'),
        actions: [
          TextButton(
              onPressed: (){},
              child: Text('add'),
          ),
        ],
      ),
      body: Column(
        children: [
         ListView.builder(
             itemBuilder: itemBuilder,

         ),


        ],
      ),
    );
  }
}
// ignore: must_be_immutable
class PetCard extends StatelessWidget {
  TextEditingController animalName=TextEditingController();
  TextEditingController animalType=TextEditingController();
  TextEditingController animalBreed=TextEditingController();
  TextEditingController birthDate=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        defaultFormField(
            controller: animalName,
            validate: (value) {
              if (value!.isEmpty) {
                return 'Please enter your full name';
              }
              return null;
            },
            label: 'name',
            prefix: Icons.person,
        ),
        ],
      ),
    );
  }
}

