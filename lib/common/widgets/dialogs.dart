import 'package:flutter/material.dart';

class Dialogs {
  static final Dialogs _singleton = Dialogs._internal();

  factory Dialogs() {
    return _singleton;
  }

  Dialogs._internal();

  static Widget quizStartDialog({required VoidCallback onTap}) {
    return AlertDialog(
     // title: const Text("Hi.."),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
        
          Text("Hi..", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
          Text("Please login before start the quiz"),
        ],
      ),
      actions: <Widget>[
        TextButton(onPressed: onTap, child: const Text('Okay'))
      ],
    );
  }

  Future<bool> showQuizEndDialog(BuildContext context) async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text('Do you want to exit the quiz without completing it?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    )) ?? false;
  }

}
