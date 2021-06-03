main() {
  Map<String, Object> pet = {"name": "john", "age": 25};
  print(pet);
  print(pet.length);
  print(pet["name"]);
  print(pet.keys);
  print(pet.values);
  print(pet.entries);
  pet["color"] = "blue";
}
