import 'package:amirtha_ayurveda/application/features/register_patient/provider/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TretmentAddedBox extends StatelessWidget {
  const TretmentAddedBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<RegisterProvider>(context);
    return Container(
      margin: const EdgeInsets.all(18),
      height: 75,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 247, 247, 247),
          borderRadius: BorderRadius.circular(8)),
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              const Expanded(
                  child: Center(
                child: Text(
                  "1.",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              )),
              const Expanded(
                  flex: 4,
                  child: Text(
                    "Couple Combo package i.",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  )),
              Expanded(
                  child: IconButton(
                icon: const Icon(IconData(0xe1af, fontFamily: 'MaterialIcons')),
                onPressed: () => registerProvider.deletingTretment(context),
                color: Colors.redAccent[100]!,
              )),
            ],
          )),
          Expanded(
              child: Row(
            children: [
              const Expanded(child: SizedBox()),
              Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text("Male",
                            style: TextStyle(color: Colors.green)),
                        Chip(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 3),
                            label: Consumer<RegisterProvider>(
                                builder: (context, data, _) {
                              return Text(data.maleCount.toString(),
                                  style: const TextStyle(color: Colors.green));
                            }))
                      ],
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "Female",
                          style: TextStyle(color: Colors.green),
                        ),
                        Chip(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 3),
                            label: Consumer<RegisterProvider>(
                                builder: (context, data, _) {
                              return Text(data.femalecount.toString(),
                                  style: const TextStyle(color: Colors.green));
                            }))
                      ],
                    ),
                  )),
              const Expanded(
                  child: Icon(
                Icons.edit_outlined,
                color: Color.fromARGB(255, 25, 104, 27),
              )),
            ],
          )),
        ],
      ),
    );
  }
}
