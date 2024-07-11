class Pet {
  final String name;
  final String breed;
  final String imageUrl;
  final int price;
  final String age;
  final String location;
  final bool gender;
  bool isFavorited;

  Pet({
    required this.name,
    required this.breed,
    required this.imageUrl,
    required this.price,
    required this.age,
    required this.location,
    required this.gender,
    this.isFavorited = false,
  });
}
