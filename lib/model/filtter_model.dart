class FilterModel {
  String animal;
  String breed;
  double priceRange;
  String gender;
  bool hypoallergenic;
  String woolLength;
  bool pedigree;
  bool vaccinations;
  String size;
  int age;
  List<String> character;

  FilterModel({
    this.animal = 'Dog',
    this.breed = 'Dachshund',
    this.priceRange = 2000.0,
    this.gender = 'Female',
    this.hypoallergenic = false,
    this.woolLength = 'Short',
    this.pedigree = true,
    this.vaccinations = true,
    this.size = 'Small',
    this.age = 2,
    this.character = const [],
  });

  FilterModel copyWith({
    String? animal,
    String? breed,
    double? priceRange,
    String? gender,
    bool? hypoallergenic,
    String? woolLength,
    bool? pedigree,
    bool? vaccinations,
    String? size,
    int? age,
    List<String>? character,
  }) {
    return FilterModel(
      animal: animal ?? this.animal,
      breed: breed ?? this.breed,
      priceRange: priceRange ?? this.priceRange,
      gender: gender ?? this.gender,
      hypoallergenic: hypoallergenic ?? this.hypoallergenic,
      woolLength: woolLength ?? this.woolLength,
      pedigree: pedigree ?? this.pedigree,
      vaccinations: vaccinations ?? this.vaccinations,
      size: size ?? this.size,
      age: age ?? this.age,
      character: character ?? this.character,
    );
  }
}
