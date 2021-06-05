class Tesla {
  String model;
  bool isAbbleToFly = false;

  Tesla({required this.model}) {}
  Tesla.plane({required this.model, this.isAbbleToFly = true}) {}
}

main(List<String> args) {
  Tesla model3 = Tesla(
    model: "model3",
  );
  print(model3.isAbbleToFly);

  Tesla modelPlane = Tesla.plane(model: "styled");
  print(modelPlane.isAbbleToFly);
}
