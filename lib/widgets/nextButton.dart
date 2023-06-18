import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pages/welcome.dart';

class NextButton extends StatelessWidget {

  final Color buttonColor;
  final String text;
  final String nextPage;
  const NextButton({Key? key, required this.buttonColor, required this.text, required this.nextPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width/3,
      height: height/20,
      child: ElevatedButton(onPressed: (){

        Get.toNamed(nextPage);

      /*Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => nextPage),
      );*/
    },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(

                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),

                )
            ),
            backgroundColor:  MaterialStateProperty.all(buttonColor),
        ),
        child: Text(text),
      ),
    );
  }
}
