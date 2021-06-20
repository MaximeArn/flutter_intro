import 'package:flutter/material.dart';

void Function(BuildContext, String) askModal =
    (BuildContext context, String question) {
  Navigator.push(
    context,
    PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext contex, _, __) => AskModal(
              question: question,
            )),
  );
};

class AskModal extends StatelessWidget {
  final String question;

  AskModal({required this.question});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black45,
      alignment: Alignment.center,
      child: Card(
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(question),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Ok")),
                  ElevatedButton(onPressed: () { Navigator.pop(context);}, child: Text("Cancel"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
