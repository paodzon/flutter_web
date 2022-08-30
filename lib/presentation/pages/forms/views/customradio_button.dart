import 'package:flutter/material.dart';

class CustomRadioButton extends StatefulWidget {
  const CustomRadioButton({Key? key}) : super(key: key);
  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

/// This is the private State class that goes with CustomRadioButton.
class _CustomRadioButtonState extends State<CustomRadioButton> {
  int value = 0;
  Widget customRadioButton(String text, int index) {
    return DecoratedBox(
      decoration: BoxDecoration(
          border: (value == index)
              ? const Border(
                  bottom: BorderSide(color: Color(0xffEC7C30), width: 3),
                )
              : null),
      child: TextButton(
        onPressed: () {
          setState(() {
            value = index;
          });
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Text(
            text,
            style: TextStyle(
              color: (value == index) ? const Color(0xffEC7C30) : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        customRadioButton("All", 1),
        customRadioButton("Published", 2),
        customRadioButton("Drafts", 3),
        customRadioButton("Archived", 4)
      ],
    );
  }
}
