import 'package:amirtha_ayurveda/application/features/auth/widgets/button.dart';
import 'package:amirtha_ayurveda/application/features/register_patient/provider/register_provider.dart';
import 'package:amirtha_ayurveda/application/features/register_patient/widgets/custom_dropdown.dart';
import 'package:amirtha_ayurveda/application/features/register_patient/widgets/treatmant_added_box.dart';
import 'package:amirtha_ayurveda/domain/entities/treatment_entitie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterAddingTreatmentCard extends StatelessWidget {
  const RegisterAddingTreatmentCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final registerprovider = Provider.of<RegisterProvider>(context);
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Treatments",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.black87),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Consumer<RegisterProvider>(builder: (context, data, _) {
          return Visibility(
              visible: data.showTreatmentAdded,
              child: const TretmentAddedBox());
        }),
        CoustomButton(
            function: () {
              showDialog(
                context: context,
                builder: (context) => SimpleDialog(
                  backgroundColor: Colors.white,
                  contentPadding: const EdgeInsets.all(20),
                  insetPadding: const EdgeInsets.all(20),
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  children: [
                    FutureBuilder(
                        future: registerprovider.fetchTreatments(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (!snapshot.hasData) {
                            return const CoustomDropDown(
                                list: [],
                                label: "Choose Treatment",
                                hintText: "Choose prefered Treatment");
                          } else {
                            List<Treatment> treatments = snapshot.data;
                            return CoustomDropDown(
                                listTretments: treatments,
                                label: "Choose Treatment",
                                hintText: "Choose prefered Treatment");
                          }
                        }),
                    const SizedBox(height: 10),
                    const Text(
                      "Add Patients",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.black87),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                            width: 100,
                            child: Chip(
                                label: Text(
                              "  Male  ",
                              style: TextStyle(color: Colors.grey),
                            ))),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                registerprovider.minisingMaleCount();
                              },
                              child: const CircleAvatar(
                                radius: 18,
                                backgroundColor:
                                    Color.fromARGB(255, 33, 95, 35),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.minimize,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                            Chip(
                              label: Consumer<RegisterProvider>(
                                  builder: (context, data, _) {
                                return Text(
                                  data.maleCount.toString(),
                                  style: const TextStyle(color: Colors.grey),
                                );
                              }),
                              backgroundColor:
                                  const Color.fromARGB(255, 247, 247, 247),
                            ),
                            GestureDetector(
                              onTap: () {
                                registerprovider.addingMaleCount();
                              },
                              child: const CircleAvatar(
                                radius: 18,
                                backgroundColor:
                                    Color.fromARGB(255, 33, 95, 35),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                            width: 100,
                            child: Chip(
                                label: Text(
                              "Female",
                              style: TextStyle(color: Colors.grey),
                            ))),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                registerprovider.minasingFemaleCount();
                              },
                              child: const CircleAvatar(
                                radius: 18,
                                backgroundColor:
                                    Color.fromARGB(255, 33, 95, 35),
                                child: Icon(
                                  Icons.minimize,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                            Chip(
                              label: Consumer<RegisterProvider>(
                                  builder: (context, data, _) {
                                return Text(
                                  data.femalecount.toString(),
                                  style: const TextStyle(color: Colors.grey),
                                );
                              }),
                              backgroundColor:
                                  const Color.fromARGB(255, 247, 247, 247),
                            ),
                            GestureDetector(
                              onTap: () {
                                registerprovider.addingFemaleCount();
                              },
                              child: const CircleAvatar(
                                radius: 18,
                                backgroundColor:
                                    Color.fromARGB(255, 33, 95, 35),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    CoustomButton(
                        function: () {
                          registerprovider.addingTretment(context);
                        },
                        text: "Save")
                  ],
                ),
              );
            },
            text: "+ Add Treatments"),
      ],
    );
  }
}

