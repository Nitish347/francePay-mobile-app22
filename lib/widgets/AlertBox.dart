import 'package:flutter/material.dart';

class PinIncorrectAlertBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Pin Incorrect'),
      content: Text('The entered pin is incorrect. Please try again.'),
      actions: <Widget>[
        ElevatedButton(
          child: Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

// Inside your Flutter widget's code
showPinIncorrectAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return PinIncorrectAlertBox();
    },
  );
}

// Example usage
void checkPin(String enteredPin, BuildContext context) {
  String correctPin = '123456'; // Replace with your actual correct pin

  if (enteredPin != correctPin) {
    showPinIncorrectAlert(context);
  } else {
    // PIN is correct, proceed with other actions
    print(true);
  }
}

void main() {
  runApp(PinIncorrectAlertBox());
}
