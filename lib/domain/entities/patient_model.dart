class Patient {
  final int id;
  final String treatmentName;
  final String branchName;
  final DateTime dateTime;
  final String name;

  Patient({
    required this.name,
    required this.id,
    required this.treatmentName,
    required this.branchName,
    required this.dateTime,
  });

 factory Patient.fromJson(Map<String, dynamic> json) {
  return Patient(
    name: json['name'] ?? "Unknown name",
    id: json['id'] ?? 0, // Provide default value if 'id' is null
    treatmentName: json['patientdetails_set'] != null && json['patientdetails_set'].isNotEmpty
        ? json['patientdetails_set'][0]['treatment_name'] ?? 'Unknown Treatment'
        : 'Unknown Treatment', // Handle nested null checks
    branchName: json['branch'] != null ? json['branch']['name'] ?? 'Unknown Branch' : 'Unknown Branch', // Handle nested null checks
    dateTime: json['date_nd_time'] != null ? DateTime.parse(json['date_nd_time']) : DateTime.now(), // Provide default value or handle differently
  );
}

}
