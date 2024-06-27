import 'package:amirtha_ayurveda/application/features/auth/widgets/button.dart';
import 'package:amirtha_ayurveda/application/features/auth/widgets/login_text_field.dart';
import 'package:amirtha_ayurveda/application/features/register_patient/provider/register_provider.dart';
import 'package:amirtha_ayurveda/domain/entities/branch_model.dart';
import 'package:amirtha_ayurveda/domain/entities/treatment_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<RegisterProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
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
        child: Form(
          key: registerProvider.formKey,
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
              CustomTextField(
                  controller: registerProvider.nameController,
                  validator: "Enter Name",
                  keyboardListener: TextInputType.text,
                  label: "Name",
                  hintText: "Enter your full name",
                  obsecure: false),
              CustomTextField(
                  controller: registerProvider.whatsNumberController,
                  validator: "Enter Number",
                  keyboardListener: TextInputType.text,
                  label: "Whatsapp Number",
                  hintText: "Enter your Whatsapp Number",
                  obsecure: false),
              CustomTextField(
                  controller: registerProvider.addressController,
                  validator: "Enter Address",
                  keyboardListener: TextInputType.text,
                  label: "Address",
                  hintText: "Enter your full address",
                  obsecure: false),
              const CoustomDropDown(
                  list: [],
                  label: "Location",
                  hintText: "Chouse your location"),
              FutureBuilder(
                  future: registerProvider.feachingBranch(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return const CoustomDropDown(
                          list: [],
                          label: "Branch",
                          hintText: "Select the branch");
                    } else {
                      return CoustomDropDown(
                          list: snapshot.data,
                          label: "Branch",
                          hintText: "Select the branch");
                    }
                  }),
              const SizedBox(height: 10),
              const RegisterAddingTreatmentCard(),
              CustomTextField(
                  controller: registerProvider.whatsNumberController,
                  validator: "Enter Amount",
                  keyboardListener: TextInputType.number,
                  label: "Total Amount",
                  hintText: "",
                  obsecure: false),
              CustomTextField(
                  controller: registerProvider.discountAmtController,
                  validator: "Enter Amount",
                  keyboardListener: TextInputType.number,
                  label: "Discount Amount",
                  hintText: "",
                  obsecure: false),
              PaymentOptionBox(registerProvider: registerProvider),
              CustomTextField(
                  controller: registerProvider.addressController,
                  validator: "Enter Amount",
                  keyboardListener: TextInputType.number,
                  label: "Advance Amount",
                  hintText: "",
                  obsecure: false),
              CustomTextField(
                  validator: "Enter Amount",
                  controller: registerProvider.balanceAmtController,
                  keyboardListener: TextInputType.number,
                  label: "Balance Amount",
                  hintText: "",
                  obsecure: false),
              TretmentTimePiker(registerProvider: registerProvider),
              const SizedBox(height: 20),
              CoustomButton(
                  function: () {
                    if (registerProvider.formKey.currentState!.validate()) {
                      
                      registerProvider.saveDate();
                    }
                  },
                  text: "Save"),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class TretmentTimePiker extends StatelessWidget {
  const TretmentTimePiker({
    super.key,
    required this.registerProvider,
  });

  final RegisterProvider registerProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Treatment Date",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.black87),
            ),
          ),
        ),
        const SizedBox(height: 5),
        GestureDetector(
          onTap: () {
            registerProvider.dataPiker(context);
          },
          child: Consumer<RegisterProvider>(builder: (context, data, _) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 247, 247, 247),
                  border: Border.all(width: 1, color: Colors.grey[300]!),
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
              child: ListTile(
                title: Text(
                  data.selectedDate == null
                      ? ""
                      : "${data.selectedDate!.day}-${data.selectedDate!.month}-${data.selectedDate!.year}",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                  ),
                ),
                trailing: const Icon(
                  Icons.calendar_today_outlined,
                  color: Color.fromARGB(255, 8, 71, 10),
                  size: 20,
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 10),
        Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Treatment Time",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.black87),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: Builder(builder: (context) {
                  return Consumer<RegisterProvider>(
                      builder: (context, data, _) {
                    return Row(
                      children: [
                        Expanded(
                            child: TretmentTimeBox(
                          onTap: () {
                            registerProvider.timePiker(context);
                          },
                          text: data.selectedTime == null
                              ? "Hour"
                              : "${data.selectedTime!.hour}",
                        )),
                        const SizedBox(width: 5),
                        Expanded(
                            child: TretmentTimeBox(
                          onTap: () {
                            registerProvider.timePiker(context);
                          },
                          text: data.selectedTime == null
                              ? "Minutes"
                              : "${data.selectedTime!.minute}",
                        )),
                      ],
                    );
                  });
                }),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class PaymentOptionBox extends StatelessWidget {
  const PaymentOptionBox({
    super.key,
    required this.registerProvider,
  });

  final RegisterProvider registerProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        Consumer<RegisterProvider>(builder: (context, data, _) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Radio(
                    fillColor: const MaterialStatePropertyAll(
                        Color.fromARGB(255, 24, 83, 27)),
                    value: data.paymentOption[0],
                    groupValue: data.currentOption,
                    onChanged: (value) {
                      registerProvider.changingPaymentType(value);
                    },
                  ),
                  const Text(
                    "Cash",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Radio(
                    fillColor: const MaterialStatePropertyAll(
                        Color.fromARGB(255, 24, 83, 27)),
                    value: data.paymentOption[1],
                    groupValue: data.currentOption,
                    onChanged: (value) {
                      registerProvider.changingPaymentType(value);
                    },
                  ),
                  const Text(
                    "Card",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Radio(
                    fillColor: const MaterialStatePropertyAll(
                        Color.fromARGB(255, 24, 83, 27)),
                    value: data.paymentOption[2],
                    groupValue: data.currentOption,
                    onChanged: (value) {
                      registerProvider.changingPaymentType(value);
                    },
                  ),
                  const Text(
                    "UPI",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          );
        }),
      ],
    );
  }
}

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

class CoustomDropDown extends StatelessWidget {
  final List<Branch>? list;
  final List<Treatment>? listTretments;
  final String label;
  final String hintText;
  const CoustomDropDown({
    super.key,
    required this.label,
    required this.hintText,
    this.list,
    this.listTretments,
  });

  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<RegisterProvider>(context);

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
          dropdownMenuEntries: list != null
              ? list!.map<DropdownMenuEntry<String>>((Branch branch) {
                  return DropdownMenuEntry<String>(
                    value: branch.name,
                    label: branch.name,
                  );
                }).toList()
              : listTretments!
                  .map<DropdownMenuEntry<String>>((Treatment treatment) {
                  return DropdownMenuEntry<String>(
                    value: treatment.branches[0].name,
                    label: treatment.branches[0].name,
                  );
                }).toList(),
          onSelected: (value) {
            registerProvider.pikingBranch(value);
          },
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
