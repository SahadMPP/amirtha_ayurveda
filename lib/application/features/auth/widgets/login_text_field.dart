import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool obsecure;
  final String? validator;
  final TextEditingController controller;
  final TextInputType keyboardListener;
  const CustomTextField({
    super.key,
   required this.controller,
    this.validator,
    required this.label,
    required this.hintText,
    required this.obsecure, required this.keyboardListener,
  });

  @override
  Widget build(BuildContext context) {
      String? validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return validator;
    }
    return null;
  }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              label,
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.black87),
            ),
          ),
          const SizedBox(height: 5),
          TextFormField(
            keyboardType: keyboardListener,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller,
            obscureText: obsecure,
            validator: validateInput,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                hintText: hintText,
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Colors.grey,
                ),
                filled: true,
                fillColor: const Color.fromARGB(255, 247, 247, 247),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey[300]!, width: 1))),
          ),
        ],
      ),
    );
  }
}
