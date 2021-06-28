import 'package:flutter/material.dart';
class AddActivityForm extends StatelessWidget {
  final GlobalKey formKey = GlobalKey <FormState>();



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: "Nom"),
              ),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: "Prix"),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(hintText: "Url"),
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
                    onPressed: () {},
                    child: Text("Confirmer"),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
