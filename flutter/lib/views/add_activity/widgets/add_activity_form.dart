import 'package:flutter/material.dart';
import 'package:flutter_chapitre13/models/activity_model.dart';

class AddActivityForm extends StatefulWidget {
  final String cityName;

  AddActivityForm({required this.cityName});

  @override
  _AddActivityFormState createState() => _AddActivityFormState();
}

class _AddActivityFormState extends State<AddActivityForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late Activity newActivity;

  @override
  void initState() {
    newActivity = Activity(
        name: widget.cityName,
        city: "",
        id: "",
        image: "",
        price: 0,
        status: ActivityStatus.ongoing);
    super.initState();
  }

  void submitForm() {
    formKey.currentState!.validate() == true
        ? formKey.currentState?.save()
        : print("error");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  return value!.isEmpty ? "remplissez le nom" : null;
                },
                decoration: InputDecoration(hintText: "Nom"),
                onSaved: (value) => newActivity.name = value!,
              ),
              SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  return value!.isEmpty ? "remplissez le prix" : null;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: "Prix"),
                onSaved: (value) => newActivity.price = double.parse(value!),
              ),
              SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  return value!.isEmpty ? "remplissez l' Url" : null;
                },
                decoration: InputDecoration(hintText: "Url image"),
                onSaved: (value) => newActivity.image = value!,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Annuler"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      submitForm();
                    },
                    child: Text("Confirmer"),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
