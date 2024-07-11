import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:petopia/model/home_model.dart';
import 'package:petopia/screens/home/cubit/cubit.dart';
import 'package:petopia/screens/home/cubit/states.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PetCubit()..loadPets(),
      child: BlocBuilder<PetCubit, PetCubitState>(
        builder: (context, state) {
          if (state is PetCubitLoaded) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Home'),
                centerTitle: true,
                actions: [
                  IconButton(
                    icon: Icon(Icons.notifications),
                    onPressed: () {
                      // Handle notifications
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {
                      // Handle settings
                    },
                  ),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(

                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text('163 matches found'),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.8,
                        ),
                        itemCount: state.pets.length,
                        itemBuilder: (context, index) {
                          final pet = state.pets[index];
                          return PetCard(pet: pet);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
                  BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
                  BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
                ],
                selectedItemColor: Colors.blue,
                unselectedItemColor: Colors.grey,
                showUnselectedLabels: true,
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class PetCard extends StatelessWidget {
  final Pet pet;

  const PetCard({required this.pet});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                  child: Image.asset(
                    'images/1.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Transform.scale(
                    scale: 0.8,
                    child: Stack(
                      children: [
                        Opacity(
                          opacity:0.7,
                          child: CircleAvatar(
                            radius: 24,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                          pet.isFavorited?Icons.favorite:Icons.favorite_border
                          ),
                          color: pet.isFavorited?Colors.red:Colors.black54,
                          onPressed: () {
                            BlocProvider.of<PetCubit>(context).toggleFavorite(pet);
                            // Handle favorite action
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(child: Text(pet.name, style: TextStyle(fontWeight: FontWeight.bold))),
                    Spacer(),
                    Text('\$${pet.price}', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Text(pet.breed,
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 4,),
                Row(
                  children: [
                    pet.gender?
                    Icon(
                        Icons.male,
                        color: Colors.blue,
                    ): Icon(
                      Icons.female,
                      color: Colors.pinkAccent,
                    ),
                   Text('${pet.age}',
                     style: TextStyle(
                       color: Colors.grey[600],
                     ),
                   ),
                    SizedBox(width: 5,),
                    Icon(
                      Icons.location_on_outlined,
                      color: Colors.purple,
                    ),
                    Expanded(child: Text('${pet.location}',
                      style: TextStyle(
                          color: Colors.grey[600],
                      ),
                      maxLines: 1,
                    ),
                    ),

                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
