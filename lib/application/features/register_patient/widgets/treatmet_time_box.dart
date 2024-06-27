import 'package:flutter/material.dart';

class TretmentTimeBox extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const TretmentTimeBox({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 247, 247, 247),
            border: Border.all(width: 1, color: Colors.grey[300]!),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: ListTile(
          title: Text(
            text,
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w300,
              fontSize: 12,
            ),
          ),
          trailing: const Icon(
            Icons.keyboard_arrow_down_outlined,
            color: Color.fromARGB(255, 8, 71, 10),
            size: 25,
          ),
        ),
      ),
    );
  }
}

