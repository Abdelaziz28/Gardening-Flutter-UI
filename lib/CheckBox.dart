import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {
  const CheckBox({super.key});

  @override
  State<CheckBox> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckBox> {
  bool isChecked = false;
  static const double width = 18.0;
  static const double height = 18.0;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {

      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;

      }
      return Colors.green;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
      visualDensity: VisualDensity(
        vertical: 2, // Adjust this value to make it smaller or larger vertically
        horizontal: 2, // Adjust this value to make it smaller or larger horizontally
      ),
    );
  }
}