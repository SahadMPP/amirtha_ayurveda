import 'package:amirtha_ayurveda/application/features/auth/widgets/button.dart';
import 'package:amirtha_ayurveda/application/features/auth/widgets/login_text_field.dart';
import 'package:amirtha_ayurveda/application/features/register_patient/provider/register_provider.dart';
import 'package:amirtha_ayurveda/domain/entities/branch_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

List<String> paymentOption = ["Cash", "Card", "UPI"];

class _RegisterPageState extends State<RegisterPage> {
  String currentOption = paymentOption[0];

  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<RegisterProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.notifications_active_outlined,
              size: 30,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Register",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontSize: 26,
                ),
              ),
            ),
            const Divider(),
            const CustomTextField(
                label: "Name",
                hintText: "Enter your full name",
                obsecure: false),
            const CustomTextField(
                label: "Whatsapp Number",
                hintText: "Enter your Whatsapp Number",
                obsecure: false),
            const CustomTextField(
                label: "Address",
                hintText: "Enter your full address",
                obsecure: false),
            const CoustomDropDown(
                list: [], label: "Location", hintText: "Chouse your location"),
            FutureBuilder(future: registerProvider.feachingBranch(),builder: (context,AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
              return  const CoustomDropDown(
                  list: [], label: "Branch", hintText: "Select the branch");
              } else {
                return  CoustomDropDown(
                  list: snapshot.data, label: "Branch", hintText: "Select the branch");
              }
            }),
            const SizedBox(height: 10),
            const RegisterAddingTreatmentCard(),
            const CustomTextField(
                label: "Total Amount", hintText: "", obsecure: false),
            const CustomTextField(
                label: "Discount Amount", hintText: "", obsecure: false),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Payment Option",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.black87),
                ),
              ),
            ),
            Row(
              children: [
                Radio(
                  value: paymentOption[0],
                  groupValue: currentOption,
                  onChanged: (value) {
                    setState(() {
                      currentOption = value.toString();
                    });
                  },
                ),
                Radio(
                  value: paymentOption[1],
                  groupValue: currentOption,
                  onChanged: (value) {
                    setState(() {
                      currentOption = value.toString();
                    });
                  },
                ),
                Radio(
                  value: paymentOption[2],
                  groupValue: currentOption,
                  onChanged: (value) {
                    setState(() {
                      currentOption = value.toString();
                    });
                  },
                ),
              ],
            ),
            const CustomTextField(
                label: "Advance Amount", hintText: "", obsecure: false),
            const CustomTextField(
                label: "Balance Amount", hintText: "", obsecure: false),
            const SizedBox(height: 10),
            CoustomButton(
                function: () {
                  // registerProvider.saveDate();

                  // registerProvider.feachingBranch();
                },
                text: "Save"),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class CoustomDropDown extends StatelessWidget {
  final List<Branch> list;
  final String label;
  final String hintText;
  const CoustomDropDown({
    super.key,
    required this.label,
    required this.hintText,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Text(
              label,
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.black87),
            ),
          ),
        ),
        const SizedBox(height: 5),
        DropdownMenu(
          
          expandedInsets: const EdgeInsets.all(14),
          inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: const Color.fromARGB(255, 247, 247, 247),
              contentPadding: const EdgeInsets.all(10),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey[300]!)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
          width: MediaQuery.of(context).size.width,
          label: Text(
            hintText,
            style: const TextStyle(
                fontSize: 12, fontWeight: FontWeight.w400, color: Colors.grey),
          ),
          menuHeight: 300,
          trailingIcon: const Icon(
            Icons.keyboard_arrow_down_outlined,
            color: Color.fromARGB(255, 33, 141, 34),
            size: 35,
          ),
          menuStyle: MenuStyle(
              shape: MaterialStatePropertyAll(ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(20)))),
                  
          dropdownMenuEntries:
              list.map<DropdownMenuEntry<String>>((Branch branch) {
            return DropdownMenuEntry<String>(
              value: branch.name,
              label: branch.name,
            );
          }).toList(),
        
          onSelected: (value) {},
          enableSearch: false,
          enableFilter: true,
        ),
      ],
    );
  }
}

class RegisterAddingTreatmentCard extends StatelessWidget {
  const RegisterAddingTreatmentCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
        Container(
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
                      child: Icon(
                    const IconData(0xe1af, fontFamily: 'MaterialIcons'),
                    color: Colors.redAccent[100]!,
                  )),
                ],
              )),
              const Expanded(
                  child: Row(
                children: [
                  Expanded(child: SizedBox()),
                  Expanded(
                      flex: 2,
                      child: SizedBox(
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Male", style: TextStyle(color: Colors.green)),
                            Chip(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 3),
                                label: Text("2",
                                    style: TextStyle(color: Colors.green)))
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
                            Text(
                              "Female",
                              style: TextStyle(color: Colors.green),
                            ),
                            Chip(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 3),
                                label: Text("2",
                                    style: TextStyle(color: Colors.green)))
                          ],
                        ),
                      )),
                  Expanded(
                      child: Icon(
                    Icons.edit_outlined,
                    color: Color.fromARGB(255, 25, 104, 27),
                  )),
                ],
              )),
            ],
          ),
        ),
        CoustomButton(
            function: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Column(
                    children: [
                      const CoustomDropDown(
                          list: [],
                          label: "Choose Treatment",
                          hintText: "Choose prefered Treatment"),
                      const Text(
                        "Add Patients",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.black87),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Chip(label: Text("Male")),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.green,
                                child: Center(child: Icon(Icons.minimize)),
                              ),
                              Chip(label: Text("0")),
                              CircleAvatar(
                                backgroundColor: Colors.green,
                                child: Icon(Icons.add),
                              ),
                            ],
                          )
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Chip(label: Text("Female")),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.green,
                                child: Center(child: Icon(Icons.minimize)),
                              ),
                              Chip(label: Text("0")),
                              CircleAvatar(
                                backgroundColor: Colors.green,
                                child: Icon(Icons.add),
                              ),
                            ],
                          )
                        ],
                      ),
                      CoustomButton(function: () {}, text: "Save")
                    ],
                  );
                },
              );
            },
            text: "+ Add Treatments"),
      ],
    );
  }
}
