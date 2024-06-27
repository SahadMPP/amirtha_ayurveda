import 'package:amirtha_ayurveda/application/features/register_patient/provider/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

