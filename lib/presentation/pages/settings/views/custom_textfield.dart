import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web/app/config/app_colors.dart';
import 'package:flutter_web/app/helpers.dart';

class CustomTextfield extends StatelessWidget {
  final String fieldName;
  final String type;
  final String placeholder;
  final List<TextInputFormatter>? inputFormatter;

  const CustomTextfield(
      {Key? key,
      required this.fieldName,
      required this.type,
      required this.placeholder,
      this.inputFormatter})
      : super(key: key);

  Map<String, dynamic> getType(type) {
    switch (type) {
      case 'email':
        return {
          'keyboardType': TextInputType.emailAddress,
          'inputFormatter':
              FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9@._-]")),
          'validator': isEmailValid,
          'errorMsg': 'Enter a valid email'
        };
      case 'number':
        return {
          'keyboardType': TextInputType.number,
          'inputFormatter': FilteringTextInputFormatter.digitsOnly,
          'errorMsg': 'Enter a number'
        };
      default:
        return {'keyboardType': TextInputType.text, 'inputFormatter': null};
    }
  }

  @override
  Widget build(BuildContext context) {
    var fieldData = {};
    fieldData = getType(type);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Text(
          fieldName,
          style: TextStyle(color: AppColors.gray700),
        ),
        const SizedBox(height: 5),
        TextFormField(
          validator: (text) {
            if (text == null || text.isEmpty) {
              return 'This field is required';
            }
            if (!fieldData['validator'](text)) {
              return fieldData['errorMsg'];
            }
            return null;
          },
          inputFormatters: [fieldData['inputFormatter']],
          keyboardType: fieldData['keyboardType'],
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            hintText: placeholder,
            hintStyle: const TextStyle(fontSize: 14),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
