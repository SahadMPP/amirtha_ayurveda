import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool obsecure;
  const LoginTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.obsecure,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
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
            obscureText: obsecure,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                hintText: hintText,
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Colors.grey,
                ),
                filled: true,
                fillColor: const Color.fromARGB(255, 247, 245, 245),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey[300]!, width: 1))),
          ),
        ],
      ),
    );
  }
}
