import 'package:amirtha_ayurveda/application/features/auth/widgets/button.dart';
import 'package:amirtha_ayurveda/application/features/patient_list/provider/patient_list_provider.dart';
import 'package:amirtha_ayurveda/domain/entities/patient_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PatientListPage extends StatelessWidget {
  const PatientListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final patientProvider = Provider.of<PatientListProvider>(context);
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(6.0),
        child: CoustomButton(
          function: () {
            patientProvider.goToRegisterPage(context);
          },
          text: "Register Now",
        ),
      ),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              patientProvider.logOut(context);
            },
          ),
        ),
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
      body: Column(
        children: [
          SizedBox(
            height: 120,
            width: double.infinity,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                size: 20,
                                color: Colors.grey[400]!,
                              ),
                              hintText: "Search for treatments",
                              hintStyle: TextStyle(
                                  fontSize: 12, color: Colors.grey[400]),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                    ContinuousRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                                backgroundColor: const MaterialStatePropertyAll(
                                    Color.fromARGB(255, 14, 90, 17))),
                            child: const Text(
                              "Search",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              //  logOUt
                              patientProvider.searchPatientList();
                              // patientProvider.fetchPatient();
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sort by :",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder(
                future: patientProvider.fetchPatient(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    final List<Patient> patientList = snapshot.data;
                    if (patientList.isEmpty) {
                      return const Center(child: Text("list is empy"));
                    } else {
                      return ListView.builder(
                          itemCount: patientList.length,
                          itemBuilder: (context, index) {
                            final String data =
                                "${patientList[index].dateTime.day}/${patientList[index].dateTime.month}/${patientList[index].dateTime.year}";
                            return PatientListCard(
                              index: index + 1,
                              treatmentName: patientList[index].treatmentName,
                              branchName: patientList[index].branchName,
                              date: data,
                              name: patientList[index].name,
                            );
                          });
                    }
                  }
                }),
          ),
        ],
      ),
    );
  }
}

class PatientListCard extends StatelessWidget {
  final int index;
  final String treatmentName;
  final String branchName;
  final String date;
  final String name;
  const PatientListCard({
    super.key,
    required this.index,
    required this.treatmentName,
    required this.branchName,
    required this.date,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.only(top: 25),
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "$index  ",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      branchName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      treatmentName,
                      maxLines: 1,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color.fromARGB(255, 32, 102, 35),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.calendar_month,
                                color: Colors.redAccent,
                                size: 16,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                date,
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.person_3_outlined,
                                color: Colors.redAccent,
                                size: 16,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                name,
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          // const SizedBox(height: 5),
          const Divider(),
          const SizedBox(
            width: double.infinity,
            height: 30,
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 5,
                  child: Text(
                    "View Booking detiles",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  child: Icon(
                    Icons.arrow_right_alt,
                    color: Color.fromARGB(255, 33, 94, 35),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
