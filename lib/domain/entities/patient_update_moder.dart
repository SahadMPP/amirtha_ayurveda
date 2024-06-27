class PatientUpdate {
  String name;
  String executive;
  String payment;
  String phone;
  String address;
  double totalAmount;
  double discountAmount;
  double advanceAmount;
  double balanceAmount;
  String dateNdTime;
  String id;
  String male;
  String female;
  String branch;
  String treatments;

  PatientUpdate({
    required this.name,
    required this.executive,
    required this.payment,
    required this.phone,
    required this.address,
    required this.totalAmount,
    required this.discountAmount,
    required this.advanceAmount,
    required this.balanceAmount,
    required this.dateNdTime,
    required this.id,
    required this.male,
    required this.female,
    required this.branch,
    required this.treatments,
  });

  factory PatientUpdate.fromJson(Map<String, dynamic> json) {
    return PatientUpdate(
      name: json['name'] ?? '',
      executive: json['executive'] ?? '',
      payment: json['payment'] ?? '',
      phone: json['phone'] ?? '',
      address: json['address'] ?? '',
      totalAmount: json['total_amount'] ?? 0.0,
      discountAmount: json['discount_amount'] ?? 0.0,
      advanceAmount: json['advance_amount'] ?? 0.0,
      balanceAmount: json['balance_amount'] ?? 0.0,
      dateNdTime: json['date_nd_time'] ?? '',
      id: '', // Always pass empty string for 'id'
      male: json['male'] ?? '',
      female: json['female'] ?? '',
      branch: json['branch'] ?? '',
      treatments: json['treatments'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'executive': executive,
      'payment': payment,
      'phone': phone,
      'address': address,
      'total_amount': totalAmount,
      'discount_amount': discountAmount,
      'advance_amount': advanceAmount,
      'balance_amount': balanceAmount,
      'date_nd_time': dateNdTime,
      'id': '', // Always send empty string for 'id'
      'male': male,
      'female': female,
      'branch': branch,
      'treatments': treatments,
    };
  }
}
