import 'package:flutter/material.dart';

class CoustomButton extends StatelessWidget {
  final VoidCallback function;
  final String text;
  const CoustomButton({
    super.key, required this.function, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: function,
          style: const ButtonStyle(
              shape: MaterialStatePropertyAll(ContinuousRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)))),
              backgroundColor: MaterialStatePropertyAll(
                  Color.fromARGB(255, 33, 95, 35))),
          child:  Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}