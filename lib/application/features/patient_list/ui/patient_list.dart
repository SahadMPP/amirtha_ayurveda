import 'package:amirtha_ayurveda/application/features/auth/widgets/button.dart';
import 'package:flutter/material.dart';

class PatientList extends StatelessWidget {
  const PatientList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(6.0),
        child: CoustomButton(
          function: () {},
          text: "Register Now",
        ),
      ),
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Icon(
            Icons.arrow_back,
            size: 30,
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
                            onPressed: () {},
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
                        // Container(
                        // decoration: BoxDecoration(border: Border.all(color: Colors.grey),
                        //   borderRadius: BorderRadius.circular(20)
                        // ),
                        //   alignment: Alignment.centerRight,
                        //   height: 40,
                        //   width: 10,
                        //   child: DropdownButton(hint: Text("Date"),items: const [
                        //     DropdownMenuItem(child:Text("he"),value:"" ,),
                        //     DropdownMenuItem(child:Text("dalascta"),value: "",),
                        //     DropdownMenuItem(child:Text("dalascta"),value: "",),
                        //   ], onChanged: (v) {}),
                        // )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const PatientListCard();
                }),
          ),
        ],
      ),
    );
  }
}

class PatientListCard extends StatelessWidget {
  const PatientListCard({
    super.key,
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
      child: const Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "1.  ",
                    style: TextStyle(
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
                      "Vikram Singh",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Couple combo packege(Rejuve......",
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color.fromARGB(255, 32, 102, 35),
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Icon(
                                Icons.calendar_month,
                                color: Colors.redAccent,
                                size: 16,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "31/01/2024",
                                style: TextStyle(
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
                              Icon(
                                Icons.person_3_outlined,
                                color: Colors.redAccent,
                                size: 16,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Jithesh",
                                style: TextStyle(
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
          Divider(),
          SizedBox(
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
