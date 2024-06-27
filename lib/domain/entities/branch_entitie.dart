class Branch {
  int id;
  String name;
  int patientsCount;
  String location;
  String phone;
  String mail;
  String address;
  String gst;
  bool isActive;

  Branch({
    required this.id,
    required this.name,
    required this.patientsCount,
    required this.location,
    required this.phone,
    required this.mail,
    required this.address,
    required this.gst,
    required this.isActive,
  });

  static fromJson(i) {}

  // factory Branch.fromJson(Map<String, dynamic> json) {
  //   return Branch(
  //     id: json['id'] ?? 0,
  //     name: json['name'] ?? '',
  //     patientsCount: json['patients_count'] ?? 0,
  //     location: json['location'] ?? '',
  //     phone: json['phone'] ?? '',
  //     mail: json['mail'] ?? '',
  //     address: json['address'] ?? '',
  //     gst: json['gst'] ?? '',
  //     isActive: json['is_active'] ?? false,
  //   );
  // }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'name': name,
  //     'patients_count': patientsCount,
  //     'location': location,
  //     'phone': phone,
  //     'mail': mail,
  //     'address': address,
  //     'gst': gst,
  //     'is_active': isActive,
  //   };
  // }
}
