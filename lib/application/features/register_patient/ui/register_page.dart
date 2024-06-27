import 'package:amirtha_ayurveda/application/features/auth/widgets/button.dart';
import 'package:amirtha_ayurveda/application/features/auth/widgets/login_text_field.dart';
import 'package:amirtha_ayurveda/application/features/register_patient/provider/register_provider.dart';
import 'package:amirtha_ayurveda/application/features/register_patient/widgets/custom_dropdown.dart';
import 'package:amirtha_ayurveda/application/features/register_patient/widgets/payment_selector.dart';
import 'package:amirtha_ayurveda/application/features/register_patient/widgets/treatmet_time_box.dart';
import 'package:amirtha_ayurveda/application/features/register_patient/widgets/tretment_card.dart';
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

