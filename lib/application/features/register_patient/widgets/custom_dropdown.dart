import 'package:amirtha_ayurveda/application/features/register_patient/provider/register_provider.dart';
import 'package:amirtha_ayurveda/domain/entities/branch_entitie.dart';
import 'package:amirtha_ayurveda/domain/entities/treatment_entitie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

